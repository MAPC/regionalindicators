(function() {















var chart
  , config = { 
      path: window.dataUrl,
      data: ['Average Private For Profit Debt'
            , 'Average Private Non-profit Debt'
            , 'Average Public Debt']  
    , series: 'pumatype'
    , errorflag: ', margin of error'
    , where: {
        column: 'Year',
        value: '2010-12'
      }
    , groupBy: {

      }
    , countBy: {

      }
    }

// Graphic
var margin = {top: 40, right: 80, bottom: 30, left: 80},
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

var commify = d3.format(",.0f");

var yAxis = d3.svg.axis()
    .scale(y)
    .tickSize(-width, 0, 0)
    .orient("left")
    .tickFormat(function(d) { return "$" + commify(d); });

var svg = d3.select(window.explainable).append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

var ds = new Miso.Dataset({
  url : config.path,
  delimiter : ',',
  columns: [{ name: 'year', type: 'string' }]
});

ds.fetch({
  success : function() {

  // we need to structure our data, from the dataset, into something d3 understands.

  var output = []; // empty box

  var cut = ds.where({ columns: config.data
                     , rows: function(row) { 
                          return row[config.where.column] == config.where.value } 
                    })

  config.data.pop()

  cut.each(function(row, rowIndex) {
    var values = [];
    this.eachColumn(function (colName, colObject, index) {

      values.push({name: colName, value: ds.rowByPosition(rowIndex)[colName]})
    })

    output.push({series: ds.rowByPosition(rowIndex)['Time Span'], values: values})
  })


  config.data.pop()

  console.log("new output", output)

  var cut = (ds.where({columns: config.data, rows: function(row) { return row[config.where.column] == config.where.value } }))

  x0.domain(output.map(function(d){ return d.series }));

  x1.domain((output[0].values).map(function(d) { return d.name })).rangeRoundBands([0, x0.rangeBand()]);

  y.domain([0, 40000]);

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
      .attr("y", -70)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Debt-to-Degree Ratio");

  var state = svg.selectAll(".state")
      .data(output)
    .enter().append("g")
      .attr("class", "g")
      .attr("transform", function(d) { console.log(d); return "translate(" + x0(d.series) + ",0)"; });

  state.selectAll("rect")
      .data(function(d) { return d.values })
    .enter().append("rect")
      .attr("width", x1.rangeBand())
      .attr("x", function(d) { return x1(d.name); })
      .attr("y", height)
      .attr("height", 0)
      .attr("title", function(d) { return d.name + ': ' })
    .attr("data-content", function(d) { return "$" + commify(d.value) })
      .style("fill", function(d) { return color(d.name); })
      .transition()
      .attr("height", function(d) { return height - y(d.value); })
      .attr("y", function(d) { return y(d.value); })
      .duration(700);

  var averagesData = [];

  (ds.columns(['Regional Average Debt', 'National Average Debt']))
  .eachColumn(function (colName, colObject, index) {
    averagesData.push({ name: colName, value: ds.rowByPosition(index)[colName] })
  });

  var averages = svg.selectAll(".regional-average")
      .data(averagesData)
    .enter().append("line")
      .attr("class", "average")
      .attr("id", function(d,i) { return "average" + i } )
      .attr("x1", 0)
      .attr("y1", function(d) { return y(d.value) })
      .attr("x2", width)
      .attr("y2", function(d) { return y(d.value) });

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
      .data(((output[0]).values).map(function (d) { return d.name }))
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

    legend.append("rect")
        .attr("x", width - 5)
        .attr("width", 18)
        .attr("height", 18)
        .style("fill", color);

    legend.append("text")
        .attr("x", width - 10)
        .attr("y", 9)
        .attr("dy", ".35em")
        .style("text-anchor", "end")
        .text(function(d) { return d; });

  var averagesLegend = svg.selectAll(".averagesLegend")
      .data(averagesData)
    .enter().append("g")
      .attr("class", "averagesLegend")
      .attr("transform", function(d, i) { return "translate(0," + (186 + (i * 24)) + ")"; });

    averagesLegend.append("text")
        .attr("x", width)
        .attr("y", 9)
        .attr("dy", ".35em")
        .style("text-anchor", "end")
        .text(function(d) { return d.name; });

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
