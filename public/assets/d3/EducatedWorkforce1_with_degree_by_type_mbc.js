(function() {


var chart
  , config = { 
      path: window.dataUrl,
      data: ['% Adults with an associate or bachelor degree']  
    , series: 'Puma Type'
    , errorflag: ', margin of error'
    , where: {
        column: 'year',
        value: '2007-11'
      }
    , groupBy: {

      }
    , countBy: {

      }
    }

var chart = d3.select(window.explainable)
  .append('svg')
  .chart('GroupedBarChart')
  .height(400);

var ds = new Miso.Dataset({
  url : config.path,
  delimiter : ',',
  columns: [{ name: 'Year', type: 'string' }]
});

ds.fetch({
  success : function() {
  // we need to structure our data, from the dataset, into something d3 understands.

  var cut = ds.where({ columns: config.data, rows: function(row) { return row[config.where.column] == config.where.value }})
  var output = [];

  (this.countBy('Puma Type')).each(function(unique, index) {
    console.log(unique['Puma Type'])
    var values = [];
    var dynamicCut = ds.where({ columns: ['Puma Type', 'Year', '% Adults with an associate or bachelor degree', '% Adults with an associate or bachelor degree, margin of error']
        , rows: function(row) { return row['Puma Type'] ==  unique['Puma Type']}  })

    dynamicCut.each(function (row, rowIndex) {
      values.push({ name: row['Year'], value: row['% Adults with an associate or bachelor degree'], error: row['% Adults with an associate or bachelor degree, margin of error'] })
    })
    output.push({ series: unique['Puma Type'], values: values})
  });

  chart.draw(output);

  },
  error : function() {
    console.log("Failure loading data")
  }
});


})();
