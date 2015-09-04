<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Demo</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="js/jquery-convert.js"></script>	<!-- jquery plugin to transform markup to tabs -->
</head>
<body>
<div class="container">
	<span id="error" class="error"></span>
	<header>
		<nav role="navigation">
			<ul id="tabs"></ul>
		
			<select> <!-- select options will be visible when the screen width is less than 960px -->
				<option value="" selected="selected">Select</option> 
			</select>
		</nav> 
	</header>
	<section>
	<div id="HTML5" class="tab-section">
		<h3 class="title">HTML Introduction</h3>
		<p id="HTML" class="para-section">
			When you browse the Web, you often come across links, the most useful way to navigate from page to page. Since HTML is about content and links are a form of content, you can create links among pages using only HTML. 
		</p>
	</div>
	<div id="CSS5" class="tab-section">
		<h3 class="title">What is CSS?</h3>
		<p id="CSS" class="para-section">
			CSS stands for Cascading Style Sheets <br/>
			CSS defines how HTML elements are to be displayed <br/>
			Styles were added to HTML 4.0 to solve a problem <br/>
			CSS saves a lot of work <br/>
			External Style Sheets are stored in CSS files
		</p>
	</div>
	<div id="JS" class="tab-section">
		<h3 class="title">Javascript Introduction</h3>

		<p id="Javascript" class="para-section">
			JavaScript is the programming language of HTML and the Web. <br/>
			Programming makes computers do what you want them to do. <br/>
			JavaScript is easy to learn. <br/>
			This tutorial will teach you JavaScript from basic to advanced.
		</p>

	</div>
	</section>
	<footer>
	<table class="table-section">
		<tr>
			<td><span><strong>Select Mark-up<strong></td>
			<td>
				<select name="tagList" id="tagList">
				<!-- select any markup (eg. div) and the added jquery plugin will convert all the div id's to the tab name -->
						<option value="-1" label="----"></option>
						
						<option value="p" label="<p>" ></option>
						<option value="a" label="<a>" ></option>
						<option value="div" label="<div>" ></option>
						<option value="img" label="<img>" ></option>
						
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><button type="button" onclick="changeToNav()"> Change </button></td>
		</tr>
	</table>
	</footer>
</div> 
<script>

function changeToNav() {
	$('*').each(function() {
		if($(this.hash).is(":hidden")) {
			$(this.hash).show();
		}
	});
	var selectedOption = $("#tagList").val();
	$('nav ul').html('');
	var n = $(selectedOption).length;
	if(n === 0){ <!-- if the following html does not contain any mark-up , it'll display the given error -->
		$('#error').html("Selected Mark-up not found!");
	}
	else {
		$('#error').html("");
		<!-- call transform jquery method with option 'convertToTabs or convertToDropdown' -->
		$(selectedOption).transform({
			action: "convertToTabs"
		});
		$('nav select').html('');
		$("nav a").transform({
			action:"convertToDropdown"
		});
	}
}
<!-- whenever an option is changed, it'll display the selected option content -->
$('nav select').change(function() {
	window.location = $(this).find("option:selected").val();
});

</script>
 
</body>
</html>
