(function() {


var chart
  , config = { 
      path: window.dataUrl,
      data: ['% Employment Change since 2005']
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

 (ds.countBy('Industry')).each(function(unique, index) {
    var values = []
    var dynamicCut = ds.where({ columns: ['Industry', '% Employment Change since 2001', 'Year'], rows: function(row) { return row['Industry'] == unique['Industry']}})

    dynamicCut.each(function(row, rowIndex) {
      values.push({ year: row['Year'], value: row['% Employment Change since 2001']})
    });

    output.push({series: unique['Industry'], values: values })
  });

  console.log("new output", output)

  chart.draw(output);

  },

  error : function() {
    console.log("Failure loading data")
  }
});

})();