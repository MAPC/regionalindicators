(function() {

var chart
  , config = { 
      path: window.dataUrl,
      data: ['Debt to Degree']  
    , series: 'Sector'
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

var chart = d3.select(window.explainable)
  .append('svg')
  .chart('LineChart')
  .height(400)
  .colors(['#582566', '#1C164E', '#1F77B4','#00AFB2','#6DBD45']);


var ds = new Miso.Dataset({
  url : config.path,
  delimiter : ','
});

ds.fetch({
  success : function() {

  // we need to structure our data, from the dataset, into something d3 understands.
  var output = []; // empty box

 (ds.countBy('Sector')).each(function(unique, index) {
    var values = []
    var dynamicCut = ds.where({ columns: ['Sector', 'Debt to Degree', 'Year'], rows: function(row) { return row['Sector'] == unique['Sector']}})

    dynamicCut.each(function(row, rowIndex) {
      values.push({ year: row['Year'], value: row['Debt to Degree']})
    });

    output.push({series: unique['Sector'], values: values})
  });

  chart.draw(output);


  },

  error : function() {
    console.log("Failure loading data")
  }
});


})();
