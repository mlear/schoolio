$(document).ready(function(){
	var chart, courseHeaders, courseGPAs;


	courseHeaders = []
	$.post('/grades/chart' , function( response ){
    	response.forEach(function(grade){
    		
    	})
        console.log(response);
        })

 chart = c3.generate({
    bindto: '#chart',
    data: {
      columns: [
        {
			course: "data1", //new_rows is only 2 length and never running
			scores: [30, 200, 100, 400, 150, 250],
		},
		{
			course: "data2",
			scores: [50, 20, 10, 40, 15, 25],
		},
		{
			course: "data3",
			scores: [50, 20, 10, 40, 15, 25],
		}
        // Need to ajax a post request for each of the students
        // courses. Each one will be a row of data, the label 
        // will be the course name.
      ]
    }
	});
})




