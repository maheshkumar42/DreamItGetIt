<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<div class="banner">
    <img src="${pageContext.request.contextPath}/resources/images/logo.png">
    <p class="title">DreamItGetIt</p>
    <div class="clearLeft"></div>
    <a href="${pageContext.request.contextPath}/">
        <button class="btn floatRight" style="width:auto;">Log Out</button>
    </a>
    <p class="caption floatRight">Automated recruiting platform...</p>
    <div class="clearRight"></div>
</div>

<ul>
    <li><a class="active" href="home.htm">Home</a></li>
    <li><a href="#news">News</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#about">About</a></li>
</ul>

<div class="row">
    <div class="column side">
        <h2></h2>
        </p>
    </div>
    <div class="column middle">
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
                    <input type="checkbox" class="skill" name="jobSkills[0].skillId" value=1>Java
                    <label for="Skill Level"><b>Skill Level</b></label>
                    <input type="radio" name="jobSkills[0].level" class="1" value=1> 1
                    <input type="radio" name="jobSkills[0].level" class="1" value=2> 2
                    <input type="radio" name="jobSkills[0].level" class="1" value=3> 3
                    <input type="radio" name="jobSkills[0].level" class="1" value=4> 4
                    <input type="radio" name="jobSkills[0].level" class="1" value=5> 5<br>

                    <input type="checkbox" class="skill" name="jobSkills[1].skillId" value=2>C
                    <label for="Skill Level"><b>Skill Level</b></label>
                    <input type="radio" name="jobSkills[1].level" class="2" value=1> 1
                    <input type="radio" name="jobSkills[1].level" class="2" value=2> 2
                    <input type="radio" name="jobSkills[1].level" class="2" value=3> 3
                    <input type="radio" name="jobSkills[1].level" class="2" value=4> 4
                    <input type="radio" name="jobSkills[1].level" class="2" value=5> 5<br>

                    <input type="checkbox" class="skill" name="jobSkills[2].skillId" value=3>C++
                    <label for="Skill Level"><b>Skill Level</b></label>
                    <input type="radio" name="jobSkills[2].level" class="3" value=1> 1
                    <input type="radio" name="jobSkills[2].level" class="3" value=2> 2
                    <input type="radio" name="jobSkills[2].level" class="3" value=3> 3
                    <input type="radio" name="jobSkills[2].level" class="3" value=4> 4
                    <input type="radio" name="jobSkills[2].level" class="3" value=5> 5<br>

                    <input type="checkbox" class="skill" name="jobSkills[3].skillId" value=4>Spring
                    <label for="Skill Level"><b>Skill Level</b></label>
                    <input type="radio" name="jobSkills[3].level" class="4" value=1> 1
                    <input type="radio" name="jobSkills[3].level" class="4" value=2> 2
                    <input type="radio" name="jobSkills[3].level" class="4" value=3> 3
                    <input type="radio" name="jobSkills[3].level" class="4" value=4> 4
                    <input type="radio" name="jobSkills[3].level" class="4" value=5> 5<br>

                    <input type="checkbox" class="skill" name="jobSkills[4].skillId" value=5>PHP
                    <label for="Skill Level"><b>Skill Level</b></label>
                    <input type="radio" name="jobSkills[4].level" class="5" value=1> 1
                    <input type="radio" name="jobSkills[4].level" class="5" value=2> 2
                    <input type="radio" name="jobSkills[4].level" class="5" value=3> 3
                    <input type="radio" name="jobSkills[4].level" class="5" value=4> 4
                    <input type="radio" name="jobSkills[4].level" class="5" value=5> 5<br>

                    <input type="checkbox" class="skill" name="jobSkills[5].skillId" value=6>Python
                    <label for="Skill Level"><b>Skill Level</b></label>
                    <input type="radio" name="jobSkills[5].level" class="6" value=1> 1
                    <input type="radio" name="jobSkills[5].level" class="6" value=2> 2
                    <input type="radio" name="jobSkills[5].level" class="6" value=3> 3
                    <input type="radio" name="jobSkills[5].level" class="6" value=4> 4
                    <input type="radio" name="jobSkills[5].level" class="6" value=5> 5<br>

                    <input type="checkbox" class="skill" name="jobSkills[6].skillId" value=7>HTML
                    <label for="Skill Level"><b>Skill Level</b></label>
                    <input type="radio" name="jobSkills[6].level" class="7" value=1> 1
                    <input type="radio" name="jobSkills[6].level" class="7" value=2> 2
                    <input type="radio" name="jobSkills[6].level" class="7" value=3> 3
                    <input type="radio" name="jobSkills[6].level" class="7" value=4> 4
                    <input type="radio" name="jobSkills[6].level" class="7" value=5> 5<br>

                    <input type="checkbox" class="skill" name="jobSkills[7].skillId" value=8>CSS
                    <label for="Skill Level"><b>Skill Level</b></label>
                    <input type="radio" name="jobSkills[7].level" class="8" value=1> 1
                    <input type="radio" name="jobSkills[7].level" class="8" value=2> 2
                    <input type="radio" name="jobSkills[7].level" class="8" value=3> 3
                    <input type="radio" name="jobSkills[7].level" class="8" value=4> 4
                    <input type="radio" name="jobSkills[7].level" class="8" value=5> 5<br>

                    <input type="checkbox" class="skill" name="jobSkills[8].skillId" value=9>JQuery
                    <label for="Skill Level"><b>Skill Level</b></label>
                    <input type="radio" name="jobSkills[8].level" class="9" value=1> 1
                    <input type="radio" name="jobSkills[8].level" class="9" value=2> 2
                    <input type="radio" name="jobSkills[8].level" class="9" value=3> 3
                    <input type="radio" name="jobSkills[8].level" class="9" value=4> 4
                    <input type="radio" name="jobSkills[8].level" class="9" value=5> 5<br>

                    <input type="checkbox" class="skill" name="jobSkills[9].skillId" value=10>JavaScript
                    <label for="Skill Level"><b>Skill Level</b></label>
                    <input type="radio" name="jobSkills[9].level" class="10" value=1> 1
                    <input type="radio" name="jobSkills[9].level" class="10" value=2> 2
                    <input type="radio" name="jobSkills[9].level" class="10" value=3> 3
                    <input type="radio" name="jobSkills[9].level" class="10" value=4> 4
                    <input type="radio" name="jobSkills[9].level" class="10" value=5> 5<br>

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
                        <a href="${pageContext.request.contextPath}/employerHome.htm">
                            <button type="button"
                                    class="cancelbtn login">Cancel
                            </button>
                        </a>
                        <button type="submit" class="signupbtn login" onclick="javascript:{return validateForm()}">Post
                            Job
                        </button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
</body>
</html>
