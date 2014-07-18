$(document).ready(function(){
	var chart, courseData;

	$.post('/grades/chart' , function( response ){
		console.log(response)
        	response.forEach(function(grade){
        		console.log(grade.course_id);
        		console.log(grade.user_id);
        		console.log(grade.gpa);
        	})
        })

 chart = c3.generate({
    bindto: '#chart',
    data: {
      columns: [
        ['data1', 30, 200, 100, 400, 150, 250],
        ['data2', 50, 20, 10, 40, 15, 25],
        // Need to ajax a post request for each of the students
        // courses. Each one will be a row of data, the label 
        // will be the course name.
      ]
    }
});
})
