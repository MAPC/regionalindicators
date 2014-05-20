(function () { 


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

d3.chart("GroupedBarChart").extend("GroupedBarChartWithAverages", {

  initialize:function () { 

    var chart = this;

    chart.averagesData = [
      {
        name: "Regional Average Debt",
        value: 15241.87
      },
      {
        name: "National Average Debt",
        value: 14731.54
      }
    ];

    chart.areas.averages = chart.base.select('g').append('g')
      .classed('averages', true);

    chart.areas.averagesLabels = chart.base.select('g').append('g')
      .classed('averages', true);  

    chart.layer('averages', chart.areas.averages, {
      dataBind: function(data) { 

        var chart = this.chart();

        return this.selectAll(".regional-average")
                  .data(chart.averagesData);
      },
      insert: function() {
        var chart = this.chart();

        return this.append("line")
              .attr("class","average")
      },
      events: {
        "enter": function () {
          this.attr("id", function(d,i) { return "average" + i } )
              .attr("x1", 0)
              .attr("y1", function(d) { return chart.yScale(d.value) })
              .attr("x2", chart.width())
              .attr("y2", function(d) { return chart.yScale(d.value) })

          this.selectAll(".regional-average")
            .append("text")
              .attr("x", chart.width())
              .attr("y", function(d) {
                return chart.yScale(d.value)
              })
              .attr("dy", ".35em")
              .style("text-anchor", "end")
              .text(function(d) { return d.name; });
        }
      }

    });

    chart.layer('averagesLabels', chart.areas.averagesLabels, {
      dataBind: function(data) { 
        var chart = this.chart();

        return this.selectAll(".regional-average")
                  .data(chart.averagesData);
      },
      insert: function() {
        var chart = this.chart();

        return this.append("text")
              .attr("class","average")
      },
      events: {
        "enter": function () {
          this.attr("x", chart.width())
              .attr("y", function(d, i) {
                return chart.yScale(d.value) - 9 + (i * 16)
              })
              .attr("dy", ".35em")
              .style("text-anchor", "end")
              .text(function(d) { return d.name; });
        }
      }

    });

  },
  transform: function (data) {

    return data;
  }

});

var chart = d3.select(window.explainable)
  .append('svg')
  .chart('GroupedBarChartWithAverages')
  .height(400);

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
  });

  chart.draw(output);


  },
  error : function() {
    console.log("Failure loading data")
  }
});
})();

