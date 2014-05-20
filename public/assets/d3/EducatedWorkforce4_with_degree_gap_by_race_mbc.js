(function() {













var chart
  , config = { 
      path: window.dataUrl,
      data: ['% Latino Gap with a Bachelor Degree or Higher',
            '% White, Non-Hispanic with Bachelor Degree or Higher',  
       , '% Black Gap with a Bachelor Degree or Higher'
       , '% Asian Gap with a Bachelor Degree or Higher'
       , '% Other  Race and Multi-racial Gap with a Bachelor Degree or Higher']  
    , series: 'MSA Name'
    , where: {
        column: 'MSA Name',
        value: ''
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
  .tickValues(['Latino', 'White', 'Black', 'Asian', 'Other Race and Multi-racial']);

var ds = new Miso.Dataset({
  url : config.path,
  delimiter : ',',
  columns: [{ name: 'MSA Name', type: 'string' }]
});

ds.fetch({
  success : function() {

  // we need to structure our data, from the dataset, into something d3 understands.

  var output = []; // empty box

  var cut = ds.where({ columns: config.data
                     , rows: function(row) { 
                          return row[config.where.column] !='Boston-Cambridge-Quincy, MA-NH Metro Area' }//== config.where.value } 
                    })

  //config.data.pop()

  cut.eachColumn( function(colName, colObject, index) {
    var values = [];

    this.each(function(row, index) {
      values.push({name: (ds.rowByPosition(index))['MSA Name'], value: row[colName] })
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
