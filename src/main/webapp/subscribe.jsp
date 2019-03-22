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
  <form method="POST" id="subscribeForm" onsubmit="return validateForm();" action="${pageContext.request.contextPath}/subscribeApplicant" 
  style="border:1px solid #ccc" modelAttribute="applicant">
  <div class="container">
    <h1 class="center">Sign Up to Subscribe</h1>
    <p class="center">Please fill in this form to create an account.</p>
    <hr>

<label for="firstName"><b>First Name</b></label>
    <input type="text" placeholder="First Name" name="firstName" required>
	
		<label for="middleName"><b>Middle Name</b></label>
    <input type="text" placeholder="Middle Name" name="middleName">
	
	<label for="lastName"><b>Last Name</b></label>
    <input type="text" placeholder="Last Name" name="lastName" required>
	
	<label for="contact"><b>Contact Number (format: xxxx-xxx-xxxx)</b></label>
    <input type="text" placeholder="Contact Number" name="contact" pattern="^\d{4}-\d{3}-\d{4}$" required>

    <label for="email"><b>Email(format: abc@server.domain)</b></label>
    <input type="text" id="emailField" placeholder="Enter Email" 
    name="emailId" pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
    
	<label for="minimumSalary"><b>Minimum Salary(Per Anum in Euros)</b></label>
    <input type="text" placeholder="Minimum Salary" name="minimumSalary" pattern="\d{1,7}" value=0>
	
	<label for="workingTime"><b>Working Time</b></label>
	  <input type="radio" name="workingTime" value=1 checked> Any
	  <input type="radio" name="workingTime" value=2> Full Time
	  <input type="radio" name="workingTime" value=3> Part Time<br><br>
	  
	  <label for="Skills"><b>Skills</b></label><br>
	   <input type="checkbox" class="skill" name="applicantSkills[0].skillId" value=1 />Java
	   <label for="Skill Level"><b>Skill Level</b></label>
	   	  <input type="radio" name="applicantSkills[0].level" class= "1" value=1  /> 1
	   	    	  <input type="radio" name="applicantSkills[0].level" class= "1" value=2 /> 2
	  <input type="radio" name="applicantSkills[0].level" class= "1" value=3 /> 3
	  <input type="radio" name="applicantSkills[0].level" class= "1" value=4 /> 4
	  <input type="radio" name="applicantSkills[0].level" class= "1" value=5 /> 5<br>
	  
	  	   <input type="checkbox" class="skill" name="applicantSkills[1].skillId" value=2 />C
	   <label for="Skill Level"><b>Skill Level</b></label>
	   	  <input type="radio" name="applicantSkills[1].level" class= "2" value=1 /> 1
	   	    <input type="radio" name="applicantSkills[1].level" class= "2" value=2 /> 2
	  <input type="radio" name="applicantSkills[1].level" class= "2" value=3 /> 3
	  <input type="radio" name="applicantSkills[1].level" class= "2" value=4 /> 4
	  <input type="radio" name="applicantSkills[1].level" class= "2" value=5 /> 5<br>
	  
	  	   <input type="checkbox" class="skill" name="applicantSkills[2].skillId" value=3 />C++
	   <label for="Skill Level"><b>Skill Level</b></label>
	   	  <input type="radio" name="applicantSkills[2].level" class= "3" value=1 /> 1
	   	  <input type="radio" name="applicantSkills[2].level" class= "3" value=2 /> 2
	  <input type="radio" name="applicantSkills[2].level" class= "3" value=3 /> 3
	  <input type="radio" name="applicantSkills[2].level" class= "3" value=4 /> 4
	  <input type="radio" name="applicantSkills[2].level" class= "3" value=5 /> 5<br>
	  
	  	   <input type="checkbox" class="skill" name="applicantSkills[3].skillId" value=4 />Spring
	   <label for="Skill Level"><b>Skill Level</b></label>
	   	  <input type="radio" name="applicantSkills[3].level" class= "4" value=1> 1
	   	   <input type="radio" name="applicantSkills[3].level" class= "4" value=2> 2
	  <input type="radio" name="applicantSkills[3].level" class= "4" value=3> 3
	  <input type="radio" name="applicantSkills[3].level" class= "4" value=4> 4
	  <input type="radio" name="applicantSkills[3].level" class= "4" value=5> 5<br>
	  
	  	   <input type="checkbox" class="skill" name="applicantSkills[4].skillId" value=5 />PHP
	   <label for="Skill Level"><b>Skill Level</b></label>
	   	  <input type="radio" name="applicantSkills[4].level" class= "5" value=1> 1
	   	  <input type="radio" name="applicantSkills[4].level" class= "5" value=2> 2
	  <input type="radio" name="applicantSkills[4].level" class= "5" value=3> 3
	  <input type="radio" name="applicantSkills[4].level" class= "5" value=4> 4
	  <input type="radio" name="applicantSkills[4].level" class= "5" value=5> 5<br>
	  
	  	   <input type="checkbox" class="skill" name="applicantSkills[5].skillId" value=6>Python
	   <label for="Skill Level"><b>Skill Level</b></label>
	   	<input type="radio" name="applicantSkills[5].level" class= "6" value=1> 1
	  <input type="radio" name="applicantSkills[5].level" class= "6" value=2> 2
	  <input type="radio" name="applicantSkills[5].level" class= "6" value=3> 3
	  <input type="radio" name="applicantSkills[5].level" class= "6" value=4> 4
	  <input type="radio" name="applicantSkills[5].level" class= "6" value=5> 5<br>
	  
	  	   <input type="checkbox" class="skill" name="applicantSkills[6].skillId" value=7>HTML
	   <label for="Skill Level"><b>Skill Level</b></label>
	   	  <input type="radio" name="applicantSkills[6].level" class= "7" value=1> 1
	   	  <input type="radio" name="applicantSkills[6].level" class= "7" value=2> 2
	  <input type="radio" name="applicantSkills[6].level" class= "7" value=3> 3
	  <input type="radio" name="applicantSkills[6].level" class= "7" value=4> 4
	  <input type="radio" name="applicantSkills[6].level" class= "7" value=5> 5<br>
	  
	  	   <input type="checkbox"  class="skill" name="applicantSkills[7].skillId" value=8>CSS
	   <label for="Skill Level"><b>Skill Level</b></label>
	   	  <input type="radio" name="applicantSkills[7].level" class= "8" value=1> 1
	   	   <input type="radio" name="applicantSkills[7].level" class= "8" value=2> 2
	  <input type="radio" name="applicantSkills[7].level" class= "8" value=3> 3
	  <input type="radio" name="applicantSkills[7].level" class= "8" value=4> 4
	  <input type="radio" name="applicantSkills[7].level" class= "8" value=5> 5<br>
	  
	  	   <input type="checkbox" class="skill" name="applicantSkills[8].skillId" value=9>JQuery
	   <label for="Skill Level"><b>Skill Level</b></label>
	   	  <input type="radio" name="applicantSkills[8].level" class= "9" value=1> 1
	   	  <input type="radio" name="applicantSkills[8].level" class= "9" value=2> 2
	  <input type="radio" name="applicantSkills[8].level" class= "9" value=3> 3
	  <input type="radio" name="applicantSkills[8].level" class= "9" value=4> 4
	  <input type="radio" name="applicantSkills[8].level" class= "9" value=5> 5<br>
	  
	  	   <input type="checkbox" class="skill" name="applicantSkills[9].skillId" value=10>JavaScript
	   <label for="Skill Level"><b>Skill Level</b></label>
	   	  <input type="radio" name="applicantSkills[9].level" class= "10" value=1> 1
	  <input type="radio" name="applicantSkills[9].level" class= "10" value=3> 3
	  <input type="radio" name="applicantSkills[9].level" class= "10" value=4> 4
	  <input type="radio" name="applicantSkills[9].level" class= "10" value=5> 5<br>
    
		  <label for="Degrees"><b>Academic Degrees</b></label><br>
	   <input type="checkbox" class="acdegree" name="applicantDegrees[0].degreeName" value="Masters"/>Masters
	   <label for="field"><b>Area of Study</b></label>
	   	  <input type="radio" name="applicantDegrees[0].degreeId" value=1 class="Masters"/> Computer Science
	  <input type="radio" name="applicantDegrees[0].degreeId" value=2 class="Masters"/> Electrical
	  <input type="radio" name="applicantDegrees[0].degreeId" value=3 class="Masters"/> Analytics<br>
	  
	  	   <input type="checkbox" class="acdegree" name="applicantDegrees[1].degreeName" value="Bachelors"/>Bachelors
	   <label for="field"><b>Area of Study</b></label>
	   	  <input type="radio" name="applicantDegrees[1].degreeId" value=4 class="Bachelors"/> Computer Science
	  <input type="radio" name="applicantDegrees[1].degreeId" value=5 class="Bachelors"/> Electrical
	  <input type="radio" name="applicantDegrees[1].degreeId" value=6 class="Bachelors"/> Analytics<br>
	  
	  	   <input type="checkbox" class="acdegree" name="applicantDegrees[2].degreeName" value="Diploma"/>Diploma
	   <label for="field"><b>Area of Study</b></label>
	   	  <input type="radio" name="applicantDegrees[2].degreeId" value=7 class="Diploma"/> Computer Science
	  <input type="radio" name="applicantDegrees[2].degreeId" value=8 class="Diploma"/> Electrical
	  <input type="radio" name="applicantDegrees[2].degreeId" value=9 class="Diploma"/> Analytics<br><br>
	  
    <div class="clearfix">
      <a href="${pageContext.request.contextPath}/"><button type="button" class="cancelbtn login">Cancel</button></a>
      <button type="submit" class="signupbtn login">Subscribe</button>
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
