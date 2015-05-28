(function() {

var chart
  , config = { 
      path: window.dataUrl,
      data: ['% High Skill Jobs']
    , series: 'MSA ID'
    , errorflag: ', margin of error'
    , where: {
        column: 'MSA ID',
        value: '14460'
      }
    , groupBy: {

      }
    , countBy: {

      }
    }

var chart = d3.select(window.explainable)
  .append('svg')
  .chart('LineChart')
  .callouts(["Boston MSA Division", "Washington MSA Division"])
  .height(400)
  .colors(d3.scale.category10());

var ds = new Miso.Dataset({
  url : config.path,
  delimiter : ','
});

ds.fetch({
  success : function() {

  var output = []; // empty box

  var cut = ds.where({ columns: config.data, rows: function(row) { return config.where.column == config.where.value } });

 (ds.countBy('MSA ID')).each(function(unique, index) {
    var values = []
    var dynamicCut = ds.where({ columns: ['MSA ID', '% High Skill Jobs', 'Year'], rows: function(row) { return row['MSA ID'] == unique['MSA ID']}})

    dynamicCut.each(function(row, rowIndex) {
      if (row['% High Skill Jobs'] !== null) {
        values.push({ year: row['Year'], value: row['% High Skill Jobs']})
      }
    });

    output.push({values: values, series: ds.rowByPosition(index)['MSA and Divisions Name']})
  });

  console.log("new output", output)


  chart.draw(output);
  

  },

  error : function() {
    console.log("Failure loading data")
  }
});

})();