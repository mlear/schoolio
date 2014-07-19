$(document).ready(function(){
	var courseHeaders, courseGPAs;
	function chart(GPAs){ 
		c3.generate({
    			bindto: '#chart',
			    data: {			
			    	json: GPAs	
			    },
			    size: { width: 600, height: 300 },
			    axis: { 
			    		y: { label: "GPA" },
			    		x: { label: "Progress Report" }
			    	  }
			});
		};


	$.post('/chart', function(response){
		courseGPAs = response;
		console.log(courseGPAs)
		chart(courseGPAs)
	})

})




