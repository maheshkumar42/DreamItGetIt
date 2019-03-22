<%--
  Created by IntelliJ IDEA.
  User: mkumar
  Date: 2019-03-18
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/validations.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/navigationStyle.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/loginStyle.css">
</head>
<body>

<%--Top banner--%>
<div class="banner">
    <img src="${pageContext.request.contextPath}/resources/images/logo.png">
    <p class="title">DreamItGetIt</p>
    <div class="clearLeft"></div>
    <button
            onclick="document.getElementById('loginForm').style.display='block'"
            class="btn floatRight" style="width: auto;">Sign In
    </button>

    <p class="caption floatRight">Platform with artificial intelligence for dream job</p>
    <div class="clearRight"></div>
</div>

<%--Initial function on load--%>
<script>
  $(document).ready(function () {
    displayFrame("home");
  });
</script>

<%--Navigation bar--%>
<ul>
    <li><a class="active link home" href="#home" onclick="javaScript:{displayFrame('home')}"> Home</a></li>
    <li><a class="link news" href="#news" onclick="javaScript:{displayFrame('news')}">News</a></li>
    <li><a class="link contact" href="#contact" onclick="javaScript:{displayFrame('contact')}">Contact</a></li>
    <li><a class="link about" href="#about" onclick="javaScript:{displayFrame('about')}">About</a></li>
</ul>

<!-- Side bar -->
<div class="row">
    <div class="column side">
        <h3 class="tips">Job search: 5 simple tips you are probably forgetting to do</h3>
        <p class="tips">1. Go offline sometimes.</p>
        <p class="tips">2. It's okay to let your personality shine.</p>
        <p class="tips">3. Tailor your resume for the specific job.</p>
        <p class="tips">4. Treat your LinkedIn profile as a living resume.</p>
        <p class="tips">5. Manners always matter.</p>
    </div>

    <!-- Middle Main Content -->
    <div id="displayContent" class="column middle"></div>
    <div id="home" class="column middle" style="display: none">
        <p>EXPERIENCE PEER TO PEER HIRING - HUNT FOR TALENT AS A TEAM</p>
        <p>Be a job-seeker or employer, you are at the right place of best fit.</p>
        <p>Looking for a job? You have found the right place!! Subscribe and start searching!</p>
        <p>
            <a href="${pageContext.request.contextPath}/subscribe.htm" class="register">Subscribe</a>
        </p>
        <h2>
				<pre>Hiring Employees?
	Find the best fit with one
	effective, intuitive platform</pre>
        </h2>
        <p>
        <pre>Powerful online tools to source and manage candidates,
	wrapped up in an interface that teams actually like to use.</pre>
        </p>
        <p>Tired of mapping your requirements and finding the best match?
            Don't Worry! Register and find best!
        <p>
            <a href="${pageContext.request.contextPath}/register.htm"
               class="register">Register as Client</a>
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
            <img src="${pageContext.request.contextPath}/resources/images/contact.jpg" alt="Norway"
                 style="width: 100%; height: 50%"><br> <br>
            <div class="caption">Get in touch with us.</div>
            <div class="caption">Help us to deliver better.</div>
            <br>
            <div class="caption">Email:yourPlatform@dreamitgetit.com</div>
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

<%--Sign in form as modal--%>
<div id="loginForm" class="modal">

    <form method="POST" class="modal-content animate" action="${pageContext.request.contextPath}/login"
          modelAttribute="loginuser">
        <div class="imgcontainer">
            <span onclick="document.getElementById('loginForm').style.display='none'" class="close" title="Close Modal">&times;</span>
            <img src="${pageContext.request.contextPath}/resources/images/avatar.png" alt="Avatar" class="avatar">
        </div>
        <div class="clearRight"></div>
        <br>

        <div class="container">
            <label for="emailId" class="login"><b>Email Id</b></label>
            <input type="text" class="login" placeholder="Enter Email Id" name="emailId" required>
            <label for="password" class="login"><b>Password</b></label>
            <input type="password" class="login" placeholder="Enter Password" name="password" required>

            <label for="userType" class="login"><b>Login As</b></label>
            <input type="radio" class="login" name="userType" value=1 checked>Applicant
            <input type="radio" class="login" name="userType" value=2>Employer<br>

            <button type="submit" class="login" onclick="document.getElementById('loginForm').style.display='none'">
                Login
            </button>
            <button type="button" onclick="document.getElementById('loginForm').style.display='none'" class="login">
                Cancel
            </button>
        </div>
    </form>
</div>

<script>
  // Get the modal
  var modal = document.getElementById('loginForm');

  // close modal when the user clicks anywhere outside of the modal
  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
</script>

<footer>Copyrights @DreamItGetIt</footer>

<script>
  if ("${signUpStatus}" == "Success")
    alert("Success! Login to your account now");
</script>

</body>
</html>
