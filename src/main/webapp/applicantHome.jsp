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

	<!-- Side bar -->

	<%
		request.getSession().setAttribute("applicantId", request.getAttribute("applicantId"));
		request.getSession().setAttribute("applicantName", request.getAttribute("applicantName"));
		request.getSession().setAttribute("jobList", request.getAttribute("jobList"));
		request.getSession().setAttribute("skillsMap", request.getAttribute("skillsMap"));
		request.getSession().setAttribute("degreesMap", request.getAttribute("degreesMap"));
		request.getSession().setAttribute("appliedJobs", request.getAttribute("appliedJobs"));
		request.getSession().setAttribute("employerInfoList", request.getAttribute("employerInfoList"));
	%>
	<div class="row">
		<div class="column side">
			<h2>Welcome ${applicantName}!</h2>
			<p>
				We missed you! <br>We are here to help you find your best!
			</p>
			<p class="tips">
				Success consists of going from failure to failure without loss of
				enthusiasm."<br>-Winston Churchill
			</p>

			<p class="tips">
				"Believe in yourself! Have faith in your abilities! Without a humble
				but reasonable confidence in your own powers you cannot be
				successful or happy."<br>-Norman Vincent Peale
			</p>

			<p class="tips">
				"You miss 100% of the shots you don't take."<br>-Wayne Gretzky
			</p>
			<br>
			<p>
				<a class="register" href="#appliedJobs"
					onclick="javaScript:{displayFrame('appliedJobs')}">Applied Jobs</a>
			</p>
		</div>

		<!-- Middle Main Content -->
		<div id="displayContent" class="column middle"></div>
		<div id="home" class="column middle" style="display: none">
			<h3 class="tips">Employers are seeking you. Here are your match.
				Get Started!</h3>
			<c:if test="${fn:length(jobList) < 1}">
				<h3 class="tips">
					Currently no jobs are qualified for your skill set. No worries.
					Enjoy a quote for the day!
					<p class="tips">
						"Only those who dare to fail greatly can ever achieve greatly."<br>
						—Robert F. Kennedy
					</p>
			</c:if>

			<c:set var="count1" value="0" scope="page" />
			<c:forEach var="job" items="${jobList}">
			<c:set var="emplStr" value="${employerInfoList[count1]}" scope="page"/>
				<c:set var="strArr"
					value="${fn:split(emplStr,'$')}" />
				<h2>Company: ${strArr[0]}</h2>
				<h3>
					<p>Job Role: ${job.jobName}</p>
				</h3>
				<p>Job Description: ${job.jobDescription}</p>
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
				<p>Contact Email: ${strArr[1]}</p>
				<p>Contact Number: ${strArr[2]}</p>					<br>
				<p>
					<a
						href="${pageContext.request.contextPath}/applyJob.htm?jobId=${job.jobId}&applicantId=${applicantId}"
						class="register">Apply for Job</a>
				</p>
				<c:set var="count1" value="${count1 + 1}" scope="page" />
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
		<div id="appliedJobs" class="column middle" style="display: none">
			<h3 class="tips">Applied Jobs</h3>
			<c:if test="${fn:length(appliedJobs) < 1}">
				<h3 class="tips">
					No jobs have been applied yet. Enjoy a quote for the day!
					<p class="tips">
						"Only those who dare to fail greatly can ever achieve greatly."<br>
						—Robert F. Kennedy
					</p>
			</c:if>
			<c:set var="count2" value="0" scope="page" />
			<c:forEach var="job" items="${appliedJobs}">
				<p>
				<h3 class="tips">Job Name : ${job.jobName}</h3>
				</p>
				<p>Job Description : ${job.jobDescription}</p>
				<p>Minimum Salary : ${job.minimumSalary}</p>
				<p>Maximum Salary : ${job.maximumSalary}</p>
				<p>Working Time : ${job.workingTime}</p>
				<p>Job Skills</p>
				<c:forEach var="jobSkill" items="${job.jobSkills}">
					<c:set var="skey" value="${jobSkill.skillId}" scope="session" />
					<p>
						<c:out value="${skillsMap[skey]}" />
						: ${jobSkill.level}
					</p>
				</c:forEach>
				<c:set var="count2" value="${count2 + 1}" scope="page" />
			</c:forEach>
			<p>
				<a class="register" href="#home"
					onclick="javaScript:{displayFrame('home')}">Back to Apply for
					Jobs</a>
			</p>
		</div>

	</div>

	<footer>Copyrights @DreamItGetIt</footer>
</body>
</html>
