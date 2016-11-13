$(function(){
	$("#btn").click(function(){
		$("img").toggle();
	});

	$("p").hover(function(){
    $("p").text("I'm a duck!");
	});
});