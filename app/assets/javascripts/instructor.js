$(document).ready(function(){

	function close(){
		$('button').click();
	}

	$('#new_course').on('submit', function ( event ){
		event.preventDefault();
		var courseData = $('#new_course').serialize();
		var courseName = document.getElementById("course_name").value;

		$.post('/courses', courseData, function( response ) { 
			close(); 
			if ($("#available_courses li") == undefined ) {
				console.log('shit')
					$("#available_courses li").append("<li><a href='/add_a_course/" + response + "'>" + courseName + "</a></li>");
				} else {
					$("#available_courses").append("<li><a href='/add_a_course/" + response + "'>" + courseName + "</a></li>");
				}

		});
	})
});