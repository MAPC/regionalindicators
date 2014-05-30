(function() {












var chart
  , config = { 
      path: window.dataUrl,
      data: ['Labor Force','Employed','Unemployed']
    , series: 'MSA ID'
    , errorflag: ', margin of error'
    , where: {
        column: '',
        value: ''
      }
    , groupBy: {

      }
    , countBy: {

      }
    }

// Graphic
var margin = {top: 20, right: 80, bottom: 30, left: 100},
    width = parseInt(d3.select(window.explainable).style('width'), 10),
    width = width - margin.left - margin.right,
    height = 450 - margin.top - margin.bottom;

var parseDate = d3.time.format("%Y").parse;

var x = d3.time.scale()
    .range([0, width]);

var y = d3.scale.linear()
    .range([height, 0]);

var y2 = d3.scale.linear()
    .range([height, 0]);

var color = d3.scale.category10();

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var commify = d3.format(",.0f");

var yAxisLeft = d3.svg.axis()
    .scale(y)
    .tickSize(-width, 0, 0)
    .orient("left");

var yAxisRight = d3.svg.axis()
    .scale(y2)
    .orient("right");

var line = d3.svg.line()
    .x(function(d) { return x(d.year); })
    .y(function(d) { return y(d.value); });

var rightLine = d3.svg.line()
    .x(function(d) { return x(d.year); })
    .y(function(d) { return y2(d.value); });

var svg = d3.select(window.explainable).append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

var ds = new Miso.Dataset({
  url : config.path,
  delimiter : ','
});

ds.fetch({
  success : function() {

  var output = []; // empty box

  var cut = ds.where({ columns: config.data });

  cut.eachColumn(function(colName, colObject, index) { 
    var values = [];

    ds.each(function(row, rowIndex) {
      values.push({ year: parseDate(row['Year'].toString()), value: row[colName]  })
    });

    output.push({ series: colName, values: values });
  });

  console.log("new output", output)

  color.domain(output.map(function(key) { return key.series }));
  x.domain(d3.extent([1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013].map(function(d) { return parseDate(d.toString()) })));

  y.domain([1500000,2750000]);

  y2.domain([0,300000]);

var recession = svg.selectAll(".recession")
    .data([1990,2001,2008,2009].map(function(d) { return parseDate(d.toString()) }))
  .enter().append("rect")
    .attr("class", "recession")
    .attr("width", function(d) { return (width/[1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013].length) + 2 })
    .attr("x", function(d) {return x(d)})
    .attr("y", 0)
    .attr("height", height)

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxisLeft)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", -75)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Labor Force and Employed");

  svg.append("g")
      .attr("class", "y axis")
      .attr("transform", "translate(" + (width) + ",0)")
      .call(yAxisRight)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 60)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Unemployed");



  var city = svg.selectAll(".city")
      .data(output)
    .enter().append("g")
      .attr("class", "city");

  city.append("path")
      .attr("class", "line")
      .attr("d", function(d) { 
        if (d.series == "Unemployed") {
          return rightLine(d.values); 
        } else {
          return line(d.values);
        }
      })
      .style("stroke", function(d) { return color(d.series); })
      .attr("title", function(d) { return 'Series: ' + d.series })
      .attr("title", function(d) { return 'Series: ' + d.series })
      .on("mouseover", function(d, i) {
        this.parentNode.parentNode.appendChild(this.parentNode);
        d3.select(this)
          .style("stroke-width", "7");
      })
      .on("mouseout", function(d, i) {
        d3.select(this)
          .transition()
          .duration(350)
          .style("stroke-width", "3");
      });

  city.append("text")
      .datum(function(d) { return { name: d.series, value: d.values[d.values.length - 1] }; })
      .attr("transform", function(d) { 
        if (d.value.value <= 300000 && d.value.value >= 0) {
          return "translate(" + x(d.value.year) + "," + y2(d.value.value) + ")";
        } else {
          return "translate(" + x(d.value.year) + "," + y(d.value.value) + ")";
        }
      })
      .attr("x", -75)
      .attr("y", 20)
      .attr("dy", ".35em")
      .attr("id", function(d,i) { return "label" + i })
      .text(function(d) { return d.name; });

  city.selectAll("circle")
      .data(function(d) { return d.values; })
      .enter().append("svg:circle")
      .attr("cx", function(d) { return x(d.year) })
      .attr("cy", function(d) { 
        if (d.value <= 300000 && d.value >= 0) {
          return y2(d.value); 
        } else {
          return y(d.value);
        }
      })
      .attr("title", function(d) { return (d.year).getFullYear() + ': ' + commify(d.value) })
      .attr("r", 3)
      .attr("fill", "black")
      .style("opacity", 0.25)
      .on("mouseover", function(d, i) {
        d3.select(this)
          .attr("r", "6"); 
      })
      .on("mouseout", function(d) {
        d3.select(this)
          .transition()
          .duration(350)
          .attr("r", "3")
      });

  var legend = svg.selectAll(".legend")
      .data(["Recession"])
    .enter().append("g")
      .attr("class", "legend")

  legend.append("rect")
      .attr("x", 35)
      .attr("y", height - 55)
      .attr("width", 18)
      .attr("height", 18)
      .attr("class", "recession");

  legend.append("text")
      .attr("x", 55)
      .attr("y", height - 45)
      .attr("dy", ".35em")
      .style("text-anchor", "beginning")
      .text(function(d) { return d; });

  $(document).ready(function () {
      $("circle").tooltip({
          'container': 'body',
          'placement': 'top'
      });
  });

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
