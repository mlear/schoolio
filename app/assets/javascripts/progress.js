$(document).ready(function(){
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
			console.log(this.text)
			$("[id='" +this.text + "']").toggle()
		};

		function classOut(){
			$("[id='" +this.text + "']").toggle()
		};


	$.post('/chart', function(data){
		console.log(data)
		courseGPAs = data;
		console.log(courseGPAs)
		chart(courseGPAs)
	})

	$('#class-list a').hover(classIn, classOut);

})




