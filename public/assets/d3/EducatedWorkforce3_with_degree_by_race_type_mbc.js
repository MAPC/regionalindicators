(function() {


var chart
  , config = { 
      path: window.dataUrl,
      data: ['% Adults with an associate or bachelor degree', 

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

var chart = d3.select(window.explainable)
  .append('svg')
  .chart('GroupedBarChart')
  .height(400)
  .tickValues(['Adults', 
      'Hispanic', 
      'Black',
      'Asian', 
      'Other Race']);

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


  chart.draw(output);


  },
  error : function() {
    console.log("Failure loading data")
  }
});


})();
