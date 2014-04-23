(function() {












var chart
  , config = { 
      path: '/viz/data/labor_force_participation_by_education_msa.csv',
      data: ['% In labor force with less than a high school diploma']  
    , series: 'MSA Name'
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
var margin = {top: 20, right: 215, bottom: 30, left: 50},
    width = parseInt(d3.select(window.explainable).style('width'), 10),
    width = width - margin.left - margin.right,
    height = 450 - margin.top - margin.bottom;

var parseDate = d3.time.format("%Y").parse;

var x = d3.time.scale()
    .range([0, width]);

var y = d3.scale.linear()
    .range([height, 0]);

var color = d3.scale.category10();

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .tickSize(-width, 0, 0)
    .orient("left");

var line = d3.svg.line()
    .x(function(d) { return x(d.year); })
    .y(function(d) { return y(d.value); });

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

  // we need to structure our data, from the dataset, into something d3 understands.
  var output = []; // empty box
  var cut = ds.where({ columns: config.data });
var calloutCache = [];
 (ds.countBy('MSA Name')).each(function(unique, index) {
    var values = []
    var dynamicCut = ds.where({ columns: ['MSA Name', '% In labor force with less than a high school diploma', 'Year'], rows: function(row) { return row['MSA Name'] == unique['MSA Name']}})

    dynamicCut.each(function(row, rowIndex) {
      values.push({ year: parseDate(row['Year'].toString()), value: row['% In labor force with less than a high school diploma']})
    });

    

    if (unique['MSA Name'] == "Boston-Cambridge-Quincy, MA-NH Metro Area" || 
            unique['MSA Name'] == "New York-Northern New Jersey-Long Island, NY-NJ-PA Metro Area" || 
            unique['MSA Name'] == "San Francisco-Oakland-Fremont, CA Metro Area" ||
            unique['MSA Name'] == "Washington-Arlington-Alexandria, DC-VA-MD-WV Metro Area" ||
            unique['MSA Name'] == "Seattle-Tacoma-Bellevue, WA Metro Area" ) {
      calloutCache.push({series: unique['MSA Name'], values: values})
    } else {
      output.push({series: unique['MSA Name'], values: values})
    }

    

  });


  console.log(calloutCache)

  calloutCache.forEach(function(element) {
    output.push(element);
  });
  console.log("new output", output)

color.domain(["Boston-Cambridge-Quincy, MA-NH Metro Area", 
        "New York-Northern New Jersey-Long Island, NY-NJ-PA Metro Area", 
        "San Francisco-Oakland-Fremont, CA Metro Area",
        "Washington-Arlington-Alexandria, DC-VA-MD-WV Metro Area",
        "Seattle-Tacoma-Bellevue, WA Metro Area"]);

  x.domain(d3.extent([2005,2006,2007,2008,2009,2010,2011,2012].map(function(d) { return parseDate(d.toString()) })));

  y.domain([
    d3.min(output, function(c) { return d3.min(c.values, function(v) { return v.value; }); }),
    d3.max(output, function(c) { return d3.max(c.values, function(v) { return v.value; }); })
  ]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", -30)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("% Labor Force Participation");

  var city = svg.selectAll(".city")
      .data(output)
    .enter().append("g")
      .attr("class", "city");

  city.append("path")
      .attr("class", "line")
      .attr("d", function(d) { return line(d.values); })
      .style("stroke", function(d) { 
        if (d.series == "Boston MSA" || 
            d.series == "New York MSA" || 
            d.series == "San Francisco MSA" ||
            d.series == "Washington MSA" ||
            d.series == "Seattle MSA" ) { 
          return color(d.series); 
        } else {
          return "lightgray"
        }
      })      
      .on("mouseover", function(d, i) {
        this.parentNode.parentNode.appendChild(this.parentNode);
        if (d.series !== "Boston MSA" && 
            d.series !== "New York MSA" && 
            d.series !== "San Francisco MSA" &&
            d.series !== "Washington MSA" &&
            d.series !== "Seattle MSA" ) {
          d3.select(this)
            .style("stroke", "darkgray")
        }

        d3.select(this)
          .style("stroke-width", "7");
        d3.select("text#label" + i)
          .style("display", "block");   
      })
      .on("mouseout", function(d, i) {

        if (d.series !== "Boston MSA" && 
            d.series !== "New York MSA" && 
            d.series !== "San Francisco MSA" &&
            d.series !== "Washington MSA" &&
            d.series !== "Seattle MSA" ) {
          d3.select(this)
            .style("stroke", "lightgray")
        }

        if (d.series !== "Boston MSA" && 
            d.series !== "New York MSA" && 
            d.series !== "San Francisco MSA" &&
            d.series !== "Washington MSA" &&
            d.series !== "Seattle MSA" ) {
          d3.select("text#label" + i)
            .transition()
            .delay(350)
            .style("display", "none");  
        }

        d3.select(this)
          .transition()
          .duration(350)
          .style("stroke-width", "3");

      });

  city.selectAll("circle")
      .data(function(d) { return d.values;})
      .enter().append("svg:circle")
      .attr("cx", function(d) { return x(d.year) })
      .attr("cy", function(d) { return y(d.value) })
      .attr("title", function(d) { return (d.year).getFullYear() + ': ' + d.value })
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

  city.append("text")
      .datum(function(d) { return {name: d.series, value: d.values[d.values.length - 1]}; })
      .attr("transform", function(d) { 
        if (d.name == "New York MSA") {
          return "translate(" + x(d.value.year) + "," + (y(d.value.value) - 6) + ")"; 
        } else {
          return "translate(" + x(d.value.year) + "," + y(d.value.value) + ")"; 
        }
      })
      .attr("x", 3)
      .attr("dy", ".35em")
      .attr("id", function(d,i) { return "label" + i })
      .text(function(d) { return d.name; })
      .call(wrap, 210)
      .style("display", function (d) {
        if (d.name == "Boston MSA" || 
            d.name == "New York MSA" || 
            d.name == "San Francisco MSA" ||
            d.name == "Washington MSA" ||
            d.name == "Seattle MSA" )
        {
          return "block"
        } else {
          return "none"
        }
      });


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
