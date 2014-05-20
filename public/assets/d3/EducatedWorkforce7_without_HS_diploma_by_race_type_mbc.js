(function() {

var chart
  , config = { 
      path: window.dataUrl,
      data: ['% Adults with less than a high school diploma'
       , '% White with less than a high school diploma'
       , '% Hispanic with less than a high school diploma'
       , '% Black with less than a high school diploma'
       , '% Asian with less than a high school diploma'
       , '% Other Race with less than a high school diploma']  
    , series: 'Puma Type'
    , where: {
        column: 'Year',
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
  .height(400)
  .tickValues(['Adults'
       , 'White'
       , 'Hispanic'
       , 'Black'
       , 'Asian'
       , 'Other Race']);

// Graphic
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

  config.data.pop()

  cut.eachColumn( function(colName, colObject, index) {
    var values = [];

    this.each(function(row, index) {
      values.push({name: (ds.rowByPosition(index))['Puma Type'], value: row[colName] })
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
