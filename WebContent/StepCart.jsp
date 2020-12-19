<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
<meta name="keywords"
	content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<link href="css/StepCart.css" rel="stylesheet" type="text/css"
	media="all" />
</head>
<body>
	<div class="container">
		<div id="stepProgressBar">
			<div class="step">
				<p class="step-text">About</p>
				<div class="bullet">1</div>
			</div>
			<div class="step">
				<p class="step-text">Contact</p>
				<div class="bullet">2</div>
			</div>
			<div class="step">
				<p class="step-text">Step 3</p>
				<div class="bullet">3</div>
			</div>
			<div class="step">
				<p class="step-text">Step 4</p>
				<div class="bullet ">4</div>
			</div>
		</div>

		<div id="main">
			<p id="content" class="text-center">Step Number 1</p>
			<button id="previousBtn">Previous</button>
			<button id="nextBtn">Next</button>
		</div>
	</div>

	<script>
	const  previousBtn  =  document.getElementById('previousBtn');
	const  nextBtn  =  document.getElementById('nextBtn');
	const  content  =  document.getElementById('content');
	const  bullets  =  [...document.querySelectorAll('.bullet')];
	const MAX_STEPS = 4;
	let currentStep = 1;
	nextBtn.addEventListener('click',  ()  =>  {
		bullets[currentStep  -  1].classList.add('completed');
		currentStep  +=  1;
		previousBtn.disabled  =  false;
		if  (currentStep  ===  MAX_STEPS)  {
			nextBtn.disabled  =  true;
		}
		content.innerText  =  `Step Number ${currentStep}`;
	});
	previousBtn.addEventListener('click',  ()  =>  {
		bullets[currentStep  -  2].classList.remove('completed');
		currentStep  -=  1;
		nextBtn.disabled  =  false;
		if  (currentStep  ===  1)  {
			previousBtn.disabled  =  true;
		}
		content.innerText  =  `Step Number ${currentStep}`;
	});
	</script>
</body>
</html>