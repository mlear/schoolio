$(document).ready(function(){

	if ($('#chart').length > 0 ){
	var courseHeaders, courseGPAs;
	function chart(GPAs){
		c3.generate({
    			bindto: '#chart',
			    data: {
			    	json: GPAs
			    },
			    // size: { width: 600, height: 300 },
			    axis: {
			    		y: { label: "GPA" },
			    		x: { label: "Progress Report" }
			    	  }
			});
		};

		function classIn(){
			$("[id='" +this.text + "']").toggle()
		};

		function classOut(){
			$("[id='" +this.text + "']").toggle()
		};


	$.post('/chart', function(data){
		courseGPAs = data;
		chart(courseGPAs)
	})

	$('#class-list a').hover(classIn, classOut);


} 
// This is logic to handle a separate instructor chart
// else {

// // FOR INSTRUCTORS
// 	var courseHeaders, courseGPAs;
// 	function chart(GPAs){
// 		c3.generate({
//     			bindto: '#instructor-chart',
// 			    data: {
// 			    	json: GPAs
// 			    },
// 			    // size: { width: 600, height: 300 },
// 			    axis: {
// 			    		y: { label: "GPA" },
// 			    		x: { label: "Progress Report" }
// 			    	  }
// 			});
// 		};

// 		function classIn(){
// 			$("[id='" +this.text + "']").toggle()
// 		};

// 		function classOut(){
// 			$("[id='" +this.text + "']").toggle()
// 		};


// 	$.post('/instructor_chart', function(data){
// 		courseGPAs = data;
// 		chart(courseGPAs)
// 	})

// 	$('#class-list a').hover(classIn, classOut);

// }
})


