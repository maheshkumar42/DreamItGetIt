<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- External resources -->
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/validations.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/navigationStyle.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/loginStyle.css">
</head>
<body>

	<!-- Website banner -->
	<div class="banner">
		<img
			src="${pageContext.request.contextPath}/resources/images/logo.png">
		<p class="title">DreamItGetIt</p>
		<div class="clearLeft"></div>
		<button
			onclick="document.getElementById('loginForm').style.display='block'"
			class="btn floatRight" style="width: auto;">Sign In</button>

		<p class="caption floatRight">Automated recruiting platform...</p>
		<div class="clearRight"></div>
	</div>

	<!-- Initial functions on load -->
	<script>
		$(document).ready(function() {
			displayFrame("home");
		});
	</script>

	<!-- Navigation bar -->
	<ul>
		<li><a class="active link home" href="#home"
			onclick="javaScript:{displayFrame('home')}"> Home</a></li>
		<li><a class="link news" href="#news"
			onclick="javaScript:{displayFrame('news')}">News</a></li>
		<li><a class="link contact" href="#contact"
			onclick="javaScript:{displayFrame('contact')}">Contact</a></li>
		<li><a class="link about" href="#about"
			onclick="javaScript:{displayFrame('about')}">About</a></li>
	</ul>

	<!-- Side bar -->
	<div class="row">
		<div class="column side">
			<h3 class="tips">Job search: 5 simple tips you are probably
				forgetting to do</h3>
			<p class="tips">1. Go offline sometimes.</p>
			<p class="tips">2. It's okay to let your personality shine.</p>
			<p class="tips">3. Tailor your resume for the specific job.</p>
			<p class="tips">4. Treat your LinkedIn profile as a living
				resume.</p>
			<p class="tips">5. Manners always matter.</p>
		</div>
				<!-- Middle Main Content -->
		<div id="displayContent" class="column middle"></div>
  <div id="home" class="column middle" style="display: none">
  <div class="login">
  <form method="POST" action="${pageContext.request.contextPath}/registerClient" 
  style="border:1px solid #ccc" modelAttribute="company">
  <div class="container">
    <h2 class="center">Register your Company</h2>
    <p class="center">Please fill in this form to create an account.</p>	
    <hr>
	
	<label for="name"><b>Name</b></label>
    <input type="text" placeholder="Company Name" name="name" required>
	
	<label for="contact"><b>Contact Number (format: xxxx-xxx-xxxx)</b></label>
    <input type="text" placeholder="Contact Number" name="contactNumber" pattern="^\d{4}-\d{3}-\d{4}$" required>

    <label for="email"><b>Email(format: abc@server.domain)</b></label>
    <input type="text" placeholder="Enter Email" name="emailId" pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

    <div class="clearfix">
      <a href="${pageContext.request.contextPath}/"><button type="button" class="cancelbtn login">Cancel</button></a>
      <button type="submit" class="signupbtn login">Sign Up</button>
    </div>
  </div>
</form>
</div>
<div id="about" class="column middle" style="display: none">
			<p>DreamItGetIt can be tailored to your company's needs and can be
				considered a starting point for setting up your employment hiring
				needs.</p>

			<p>Candidate profiles and the candidate database: a rich source
				of talent Keep a full record of every job candidate who has ever
				been applied to, your company. Search the candidate database and
				view individuals as rich candidate profiles.</p>

			<p>Nurture candidates over time, and progress the best through
				your hiring pipeline.</p>
		</div>
		<div id="contact" class="column middle " style="display: none">
			<div class="contact-container">
				<img
					src="${pageContext.request.contextPath}/resources/images/contact.jpg"
					alt="Norway" style="width: 100%; height: 50%"><br> <br>
				<div class="caption">Get in touch with us.</div>
				<div class="caption">Help us to deliver better.</div>
				<br>
				<div class="caption">Email:yourPlatform@DreamItGetIt.com</div>
				<br>
				<div class="caption">Phone:123-4444-6666</div>
			</div>
		</div>
		<div id="news" class="column middle " style="display: none">
			<br>
			<div class="caption">No recent developments.</div>
			<br>
			<div class="caption">But stay in touch! Keep Tracking!!</div>
			<br>
		</div>
	</div>

  </div>
</body>
</html>
