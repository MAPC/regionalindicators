(function() {

var chart
  , config = { 
      path: window.dataUrl,
      data: ['No High School Diploma']  
    , series: 'MSA Name'
    , errorflag: ''
    , where: {
        column: '',
        value: ''
      }
    }

var chart = d3.select(window.explainable)
  .append('svg')
  .chart('LineChart')
  .height(400)
  .callouts(["Boston, MA MSA", "United States"]);


var ds = new Miso.Dataset({
  url : config.path,
  delimiter : ','
});

ds.fetch({
  success : function() {



  // we need to structure our data, from the dataset, into something d3 understands.
  var output = []; // empty box

 (ds.countBy('MSA Name')).each(function(unique, index) {
    var values = [];
    var dynamicCut = ds.where({ columns: ['MSA Name', 'No High School Diploma', 'Year'], rows: function(row) { return row['MSA Name'] == unique['MSA Name']}})

    dynamicCut.each(function(row, rowIndex) {
      values.push({ year: row['Year'], value: row['No High School Diploma']})
    });
    output.push({series: unique['MSA Name'], values: values})
  });
  console.log(output);
  chart.draw(output);

  },

  error : function() {
    console.log("Failure loading data")
  }
});


})();
