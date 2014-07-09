(function() {
















var chart
  , config = { 
      path: '/viz/data/edattain_by_race_puma.csv',
      data: ['% Adults with an associate or bachelor degree', 
      '% White with an associate or bachelor degree', 
      '% Hispanic with an associate or bachelor degree', 
      '% Black with an associate or bachelor degree',
      '% Asian with an associate or bachelor degree', 
      '% Other Race with an associate or bachelor degree'], 
    series: 'Puma Type',
    errorflag: ', margin of error', 
    where: {
        column: 'Year',
        value: '2007-11'
      }
    }

// Graphic
var margin = {top: 40, right: 120, bottom: 30, left: 40},
   width = parseInt(d3.select(window.explainable).style('width'), 10),
    width = width - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

var x0 = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1);

var x1 = d3.scale.ordinal();

var y = d3.scale.linear()
    .range([height, 0]);

var color = d3.scale.ordinal()
    .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

var xAxis = d3.svg.axis()
    .scale(x0)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .tickSize(-width, 0, 0)
    .orient("left")
    .tickFormat(d3.format(".2s"));

var svg = d3.select(window.explainable).append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

var ds = new Miso.Dataset({
  url : config.path,
  delimiter : ',',
  columns: [{ name: 'Year', type: 'string' }]
});

ds.fetch({
  success : function() {

  // we need to structure our data, from the dataset, into something d3 understands.

  var output = []; // empty box

  var cut = ds.where({ columns: config.data
                     , rows: function(row) { 
                          return row[config.where.column] == config.where.value } 
                    })

  cut.eachColumn( function(colName, colObject, index) {
    var values = [];

    this.each(function(row, index) {
      values.push({name: (ds.rowByPosition(index))['Puma Type'], value: row[colName], error: (ds.rowByPosition(index))[colName + config.errorflag] })
    });

  output.push({ series: colName, values: values})
  });

  config.data.pop();

  console.log("new output", output);

  x0.domain(config.data);

  x1.domain((output[0].values).map(function(d) { return d.name })).rangeRoundBands([0, x0.rangeBand()]);
  y.domain([0, 100]);
  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
      .selectAll("text")
      .call(wrap, x0.rangeBand());

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", -35)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Percent");

  var state = svg.selectAll(".state")
      .data(output)
    .enter().append("g")
      .attr("class", "g")
      .attr("transform", function(d) { return "translate(" + x0(d.series) + ",0)"; });

  state.selectAll("rect")
      .data(function(d) { return d.values })
    .enter().append("rect")
      .attr("width", x1.rangeBand())
      .attr("x", function(d) { return x1(d.name); })
      .attr("y", height)
      .attr("height", 0)
      .attr("title", function(d) { return d.name })
      .attr("data-content", function(d) { return "Estimate: " + d.value + '%' + "<br/> Margin of Error: " + d.error + '%' })
      .style("fill", function(d) { return color(d.name); })
      .transition()
      .attr("height", function(d) { return height - y(d.value); })
      .attr("y", function(d) { return y(d.value); })
      .duration(700);

  state.selectAll("line")
      .data(function(d) { return d.values })
    .enter().append("line")
      .attr("class", "error")
      .attr("x1", function(d) { return x1(d.name) + (x1.rangeBand()/2); })
      .attr("y1", function(d) { return y((d.value + d.error)) })
      .attr("x2", function(d) { return x1(d.name) + (x1.rangeBand()/2); })
      .attr("y2", function(d) { return y((d.value - d.error)) })

  $(document).ready(function () {
      $("svg rect").popover({
          'container': 'body',
          'placement': 'right',
          'trigger': 'hover',
          'html': true
      });
  });

  /* legend */

  var legend = svg.selectAll(".legend")
      .data(output[0].values.map(function(e){ return e.name }))
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  legend.append("rect")
      .attr("x", width - 45)
      .attr("y", -13)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", color);

  legend.append("text")
      .attr("x", width - 50)
      .attr("y", -4)
      .attr("dy", ".35em")
      .style("text-anchor", "end")
      .text(function(d) { return d; });

  function wrap(text, width) {
    text.each(function() {
      var text = d3.select(this),
          words = text.text().split(/\s+/).reverse(),
          word,
          line = [],
          lineNumber = 0,
          lineHeight = 1.1, // ems
          y = text.attr("y"),
          dy = parseFloat(text.attr("dy")),
          tspan = text.text(null).append("tspan").attr("x", 0).attr("y", y).attr("dy", dy + "em");
      while (word = words.pop()) {
        line.push(word);
        tspan.text(line.join(" "));
        if (tspan.node().getComputedTextLength() > width) {
          line.pop();
          tspan.text(line.join(" "));
          line = [word];
          tspan = text.append("tspan").attr("x", 0).attr("y", y).attr("dy", ++lineNumber * lineHeight + dy + "em").text(word);
        }
      }
    });
  }

  },
  error : function() {
    console.log("Failure loading data")
  }
});


})();
