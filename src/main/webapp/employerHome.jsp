<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
</head>
<body>

	<!-- Website banner -->
	<div class="banner">
		<img
			src="${pageContext.request.contextPath}/resources/images/logo.png">
		<p class="title">DreamItGetIt</p>
		<div class="clearLeft"></div>
		<a href="${pageContext.request.contextPath}/"><button
				class="btn floatRight" style="width: auto;">Log Out</button></a>
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

<div class="row">
  <div class="column side">
    <h2>"Welcome ${employerName}"</h2>
    <p>Find your best match with least efforts.</p>
    <p>Get Started!!</p>
    	  <% 
	  request.getSession().setAttribute("empId", request.getAttribute("employerId"));
	  request.getSession().setAttribute("empName", request.getAttribute("employerName"));
	  request.getSession().setAttribute("jobList", request.getAttribute("jobList"));
	  request.getSession().setAttribute("skillsMap", request.getAttribute("skillsMap"));
	  request.getSession().setAttribute("degreesMap", request.getAttribute("degreesMap"));
	  %>
    <p><a href="${pageContext.request.contextPath}/postJob.htm" class="register">Post Jobs</a></p>
  </div>
  	<!-- Middle Main Content -->
		<div id="displayContent" class="column middle"></div>
		<div id="home" class="column middle" style="display: none">
    <h3 class="tips">Posted Jobs:</h3>
			<c:if test="${fn:length(jobList) < 1}">
				<h3 class="tips">
					No jobs posted by you yet.
					Enjoy a quote for the day!
					<p class="tips">
						"Only those who dare to fail greatly can ever achieve greatly."<br>
						—Robert F. Kennedy
					</p>
			</c:if>
	
	<c:forEach var="job" items="${jobList}">
	<div id="jobRow">
	<input type="hidden" name="selectedJob" value=${job}/></div>
	<p>Job Name : ${job.jobName}</p>
	<p>Job Description : ${job.jobDescription}</p>
	<p>Minimum Salary : ${job.minimumSalary}</p>
	<p>Maximum Salary : ${job.maximumSalary}</p>
	<p>Working Time : ${job.workingTime}</p>
	<p>Job Skills:</p>
				<c:forEach var="jobSkill" items="${job.jobSkills}">
					<c:set var="skey" value="${jobSkill.skillId}" scope="session" />
					<p>
						<c:out value="${skillsMap[skey]}" />
						: ${jobSkill.level}
					</p>
				</c:forEach>
				<p>Academic Degrees:</p>
				<c:forEach var="jobDegree" items="${job.jobDegrees}">
					<c:set var="dkey" value="${jobDegree.degreeId}" scope="session" />
					<p>
						<c:out value="${degreesMap[dkey]}" />
					</p>
				</c:forEach>
	<p><a href="${pageContext.request.contextPath}/viewQualifiedApplicants?jobId=${job.jobId}"
	 class="register">View Qualified Applicants</a></p><br><br>
	</c:forEach>
	
	
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
				<br>
				<div class="caption">Help us to deliver better.</div>
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
		<div id="jobPostings" class="column middle " style="display: none">
		  <div class="login">
  <form method="POST" action="${pageContext.request.contextPath}/saveJob" 
  style="border:1px solid #ccc" modelAttribute="job">
  <div class="container">
    <h1 class="center">Job Profile</h1>
    <hr>

<label for="jobName"><b>Job Name</b></label>
    <input type="text" placeholder="Job Name" name="jobName" required>
	
		<label for="jobDescription"><b>Job Description</b></label>
    <input type="text" placeholder="Job Description" name="jobDescription" required>
	
	<label for="minimumSalary"><b>Minimum Salary</b></label>
    <input type="text" placeholder="Minimum Salary" name="minimumSalary" required>
    
    <label for="maximumSalary"><b>Maximum Salary</b></label>
    <input type="text" placeholder="Maximum Salary" name="maximumSalary" required>
	
	<label for="workingTime"><b>Working Time</b></label>
	  <input type="radio" name="workingTime" value=1 checked> Any
	  <input type="radio" name="workingTime" value=2> Full Time
	  <input type="radio" name="workingTime" value=3> Part Time<br><br>
	  
	  <label for="Skills"><b>Required Skills</b></label><br>
	     <input type="checkbox" id="skill" name="jobSkills[0].skillId" value=1>Java
	   <label for="Skill Level"><b>Skill Level</b></label>
	    <input type="radio" name="jobSkills[0].level" checked value=0> 0
	   	  <input type="radio" name="jobSkills[0].level" value=1> 1
	  <input type="radio" name="jobSkills[0].level" value=3> 3
	  <input type="radio" name="jobSkills[0].level" value=4> 4
	  <input type="radio" name="jobSkills[0].level" value=5> 5<br>
	  
  	   <input type="checkbox" id="skill" name="jobSkills[1].skillId" value=2>C
	   <label for="Skill Level"><b>Skill Level</b></label>
	    <input type="radio" name="jobSkills[1].level" checked value=0> 0
	   	  <input type="radio" name="jobSkills[1].level" value=1> 1
	  <input type="radio" name="jobSkills[1].level" value=3> 3
	  <input type="radio" name="jobSkills[1].level" value=4> 4
	  <input type="radio" name="jobSkills[1].level" value=5> 5<br>
	  
	  	   <input type="checkbox" id="skill" name="jobSkills[2].skillId" value=3>C++
	   <label for="Skill Level"><b>Skill Level</b></label>
	    <input type="radio" name="jobSkills[2].level" checked value=0> 0
	   	  <input type="radio" name="jobSkills[2].level" value=1> 1
	  <input type="radio" name="jobSkills[2].level" value=3> 3
	  <input type="radio" name="jobSkills[2].level" value=4> 4
	  <input type="radio" name="jobSkills[2].level" value=5> 5<br>
	  
	  	   <input type="checkbox" id="skill" name="jobSkills[3].skillId" value=4>Spring
	   <label for="Skill Level"><b>Skill Level</b></label>
	    <input type="radio" name="jobSkills[3].level" checked value=0> 0
	   	  <input type="radio" name="jobSkills[3].level" value=1> 1
	  <input type="radio" name="jobSkills[3].level" value=3> 3
	  <input type="radio" name="jobSkills[3].level" value=4> 4
	  <input type="radio" name="jobSkills[3].level" value=5> 5<br>
	  
	  	   <input type="checkbox" id="skill" name="jobSkills[4].skillId" value=5>PHP
	   <label for="Skill Level"><b>Skill Level</b></label>
	    <input type="radio" name="jobSkills[4].level" checked value=0> 0
	   	  <input type="radio" name="jobSkills[4].level" value=1> 1
	  <input type="radio" name="jobSkills[4].level" value=3> 3
	  <input type="radio" name="jobSkills[4].level" value=4> 4
	  <input type="radio" name="jobSkills[4].level" value=5> 5<br>
	  
	  	   <input type="checkbox" id="skill" name="jobSkills[5].skillId" value=6>Python
	   <label for="Skill Level"><b>Skill Level</b></label>
	   <input type="radio" name="jobSkills[5].level" value=0 checked> 0
	   	<input type="radio" name="jobSkills[5].level" value=1> 1
	  <input type="radio" name="jobSkills[5].level" value=2> 2
	  <input type="radio" name="jobSkills[5].level" value=3> 3
	  <input type="radio" name="jobSkills[5].level" value=4> 4
	  <input type="radio" name="jobSkills[5].level" value=5> 5<br>
	  
	  	   <input type="checkbox" id="skill" name="jobSkills[6].skillId" value=7>HTML
	   <label for="Skill Level"><b>Skill Level</b></label>
	    <input type="radio" name="jobSkills[6].level" checked value=0> 0
	   	  <input type="radio" name="jobSkills[6].level" value=1> 1
	  <input type="radio" name="jobSkills[6].level" value=3> 3
	  <input type="radio" name="jobSkills[6].level" value=4> 4
	  <input type="radio" name="jobSkills[6].level" value=5> 5<br>
	  
	  	   <input type="checkbox"  id="skill" name="jobSkills[7].skillId" value=8>CSS
	   <label for="Skill Level"><b>Skill Level</b></label>
	    <input type="radio" name="jobSkills[7].level" checked value=0> 0
	   	  <input type="radio" name="jobSkills[7].level" value=1> 1
	   	   <input type="radio" name="jobSkills[7].level" value=2> 2
	  <input type="radio" name="jobSkills[7].level" value=3> 3
	  <input type="radio" name="jobSkills[7].level" value=4> 4
	  <input type="radio" name="jobSkills[7].level" value=5> 5<br>
	  
	  	   <input type="checkbox" id="skill" name="jobSkills[8].skillId" value=9>JQuery
	   <label for="Skill Level"><b>Skill Level</b></label>
	    <input type="radio" name="jobSkills[8].level" checked value=0> 0
	   	  <input type="radio" name="jobSkills[8].level" value=1> 1
	   	  <input type="radio" name="jobSkills[8].level" value=2> 2
	  <input type="radio" name="jobSkills[8].level" value=3> 3
	  <input type="radio" name="jobSkills[8].level" value=4> 4
	  <input type="radio" name="jobSkills[8].level" value=5> 5<br>
	  
	  	   <input type="checkbox" id="skill" name="jobSkills[9].skillId" value=10>JavaScript
	   <label for="Skill Level"><b>Skill Level</b></label>
	    <input type="radio" name="jobSkills[9].level" checked value=0> 0
	   	  <input type="radio" name="jobSkills[9].level" value=1> 1
	  <input type="radio" name="jobSkills[9].level" value=3> 3
	  <input type="radio" name="jobSkills[9].level" value=4> 4
	  <input type="radio" name="jobSkills[9].level" value=5> 5<br> 
    
  <label for="Degrees"><b>Academic Degrees</b></label><br>
	   <input type="checkbox" class="acdegree" name="jobDegrees[0].degreeName" value="Masters"/>Masters
	   <label for="field"><b>Area of Study</b></label>
	   	  <input type="radio" name="jobDegrees[0].degreeId" value=1 class="Masters"/> Computer Science
	  <input type="radio" name="jobDegrees[0].degreeId" value=2 class="Masters"/> Electrical
	  <input type="radio" name="jobDegrees[0].degreeId" value=3 class="Masters"/> Analytics<br>
	  
	  	   <input type="checkbox" class="acdegree" name="jobDegrees[1].degreeName" value="Bachelors"/>Bachelors
	   <label for="field"><b>Area of Study</b></label>
	   	  <input type="radio" name="jobDegrees[1].degreeId" value=4 class="Bachelors"/> Computer Science
	  <input type="radio" name="jobDegrees[1].degreeId" value=5 class="Bachelors"/> Electrical
	  <input type="radio" name="jobDegrees[1].degreeId" value=6 class="Bachelors"/> Analytics<br>
	  
	  	   <input type="checkbox" class="acdegree" name="jobDegrees[2].degreeName" value="Diploma"/>Diploma
	   <label for="field"><b>Area of Study</b></label>
	   	  <input type="radio" name="jobDegrees[2].degreeId" value=7 class="Diploma"/> Computer Science
	  <input type="radio" name="jobDegrees[2].degreeId" value=8 class="Diploma"/> Electrical
	  <input type="radio" name="jobDegrees[2].degreeId" value=9 class="Diploma"/> Analytics<br><br>
	  
	  <input type="hidden" name="employerId" value="${employerId}">
	   <input type="hidden" name="empId" value="${employerId}">
	  <input type="hidden" name="empName" value="${employerName}">
	  <% 
	  request.getSession().setAttribute("empId", request.getAttribute("employerId"));
	  request.getSession().setAttribute("empName", request.getAttribute("employerName"));
	  request.getSession().setAttribute("jobList", request.getAttribute("jobList"));
	  request.getSession().setAttribute("skillsMap", request.getAttribute("skillsMap"));
	  request.getSession().setAttribute("degreesMap", request.getAttribute("degreesMap"));
	  %>
    <div class="clearfix">
      <a href="${pageContext.request.contextPath}/employerHome.htm"><button type="button" 
      class="cancelbtn login">Cancel</button></a>
      <button type="submit" class="signupbtn login">Sign Up</button>
    </div>
  </div>
</form>
</div>
		</div>
</div>

<footer>Copyrights @DreamItGetIt</footer>
</body>
</html>
