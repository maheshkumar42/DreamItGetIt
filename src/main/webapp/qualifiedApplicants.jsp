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
			displayFrame("qualifiedAppl");
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
		<div id="qualifiedAppl" class="column middle" style="display: none">
    <h3 class="tips">Qualified Applicants:</h3>
			<c:if test="${fn:length(applicantList) < 1}">
				<h3 class="tips">
					No applicants qualify for this job.
			</c:if>
	
	<c:forEach var="applicant" items="${applicantList}">
	<p>Applicant Name : ${applicant.lastName}&nbsp;${applicant.firstName}&nbsp;${applicant.middleName}</p>
	<p>Email : ${applicant.emailId}</p>
	<p>Minimum Salary : ${applicant.minimumSalary}</p>
	<p>Working Time : ${applicant.workingTime}</p>
				<c:set var="wTime" value="${applicant.workingTime}" scope="session" />
			<c:if test = "wTime == '1'">
			<p>Working Time : Any</p>
			</c:if>
						<c:if test = "wTime == '2'">
			<p>Working Time : Full Time</p>
			</c:if>
									<c:if test = "wTime == '3'">
			<p>Working Time : Part Time</p>
			</c:if>
	<p>Job Skills:</p>
				<c:forEach var="appSkill" items="${applicant.applicantSkills}">
					<c:set var="skey" value="${appSkill.skillId}" scope="session" />
					<p>
						<c:out value="${skillsMap[skey]}" />
						: ${appSkill.level}
					</p>
				</c:forEach>
				<p>Academic Degrees:</p>
				<c:forEach var="appDegree" items="${applicant.applicantDegrees}">
					<c:set var="dkey" value="${appDegree.degreeId}" scope="session" />
					<p>
						<c:out value="${degreesMap[dkey]}" />
					</p>
				</c:forEach>
				<p>Aggregate Skill Level : ${applicant.aggregateSkillLevel}</p>
<br><br>
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
		<div id="home" class="column middle " style="display: none">
			<c:forEach var="job" items="${jobList}">
	<div id="jobRow">
	<input type="hidden" name="selectedJob" value=${job}/></div>
	<p>Job Name : ${job.jobName}</p>
	<p>Job Description : ${job.jobDescription}</p>
	<p>Minimum Salary : ${job.minimumSalary}</p>
	<p>Maximum Salary : ${job.maximumSalary}</p>
			<c:set var="wTime" value="${job.workingTime}" scope="session" />
			<c:if test = "wTime == '1'">
			<p>Working Time : Any</p>
			</c:if>
						<c:if test = "wTime == '2'">
			<p>Working Time : Full Time</p>
			</c:if>
									<c:if test = "wTime == '3'">
			<p>Working Time : Part Time</p>
			</c:if>
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
		
</div>

<footer>Copyrights @DreamItGetIt</footer>
</body>
</html>
