(function() {

var chart
  , config = { 
      path: window.dataUrl,
      data: ['Employment']
    , series: 'Community Type'
    , errorflag: ', margin of error'
    , where: {
	
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

  (ds.countBy('Community Type')).each(function(MSAUnique,index) { 
    var values = [];
    (ds.countBy('Year')).each(function(unique,index) {
      var cut = ds.where({ columns: ['Employment'], rows: function(row) { return row['Community Type'] == MSAUnique['Community Type'] && row['Year'] == unique['Year'] } });

      cut.each(function(row, rowIndex) { 
        values.push({ year: unique['Year'], value: row['Employment'] })
      });
    });

    output.push({ series: MSAUnique['Community Type'], values: values });
  });

  console.log("new output", output)

  chart.draw(output);

  },

  error : function() {
    console.log("Failure loading data")
  }
});

})();