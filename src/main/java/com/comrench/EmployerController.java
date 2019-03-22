package com.comrench;

import com.comrench.DAO.DegreeDAO;
import com.comrench.DAO.JobDAO;
import com.comrench.Entity.Applicant;
import com.comrench.Entity.Degree;
import com.comrench.Entity.Job;
import com.comrench.Entity.JobDegrees;
import com.comrench.Entity.JobSkills;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class EmployerController {

  @Autowired
  private JobDAO jobDAO;

  @Autowired
  private DegreeDAO degreeDAO;

  // Saves the employer posted job to database
  @RequestMapping(value = "/saveJob", method = RequestMethod.POST)
  public ModelAndView saveJob(@ModelAttribute("job") Job job, BindingResult result, ModelMap model) {
    ModelAndView modelAndView;

    if (result.hasErrors()) {
      modelAndView = new ModelAndView("error.jsp");
      return modelAndView;
    }
    List<JobSkills> newjs = new ArrayList<JobSkills>();
    List<JobDegrees> newjd = new ArrayList<JobDegrees>();

    // Clean Job Skills
    for (JobSkills js : job.getJobSkills()) {
      if (js.getSkillId() != 0) {
        newjs.add(js);
      }
    }

    job.setJobSkills(newjs);

    // Clean JOb Degrees
    for (JobDegrees jds : job.getJobDegrees()) {
      if (jds.getDegreeId() != 0)
        newjd.add(jds);
    }

    job.setJobDegrees(newjd);

    if (newjd.isEmpty() || newjs.isEmpty()) {
      modelAndView = new ModelAndView("error.jsp");
      return modelAndView;
    }

    boolean status = jobDAO.saveJob(job);
    System.out.println("Save job status: " + status);
    List<Job> jobList = jobDAO.fetchEmployerJobs(job.getEmployerId());

    modelAndView = new ModelAndView("employerHome.jsp");
    modelAndView.addObject("employerId", job.empId);
    modelAndView.addObject("employerName", job.empName);
    modelAndView.addObject("jobList", jobList);

    return modelAndView;
  }

  // Redirect handler for job posting
  @RequestMapping("/postJob.htm")
  public ModelAndView postJob(HttpServletRequest request){
    ModelAndView modelAndView = new ModelAndView("jobPostings.jsp");
    modelAndView.addObject("employerId", request.getSession().getAttribute("empId"));
    modelAndView.addObject("employerName", request.getSession().getAttribute("empName"));
    modelAndView.addObject("jobList", request.getSession().getAttribute("jobList"));
    modelAndView.addObject("skillsMap", request.getSession().getAttribute("skillsMap"));
    modelAndView.addObject("degreesMap", request.getSession().getAttribute("degreesMap"));
    return modelAndView;
  }

  // Redirect handler for employer home page requests
  @RequestMapping("/employerHome.htm")
  public ModelAndView employerHome(HttpServletRequest request) {
    ModelAndView modelAndView = new ModelAndView("employerHome.jsp");
    modelAndView.addObject("employerId", request.getSession().getAttribute("empId"));
    modelAndView.addObject("employerName", request.getSession().getAttribute("empName"));
    modelAndView.addObject("jobList", request.getSession().getAttribute("jobList"));
    modelAndView.addObject("skillsMap", request.getSession().getAttribute("skillsMap"));
    modelAndView.addObject("degreesMap", request.getSession().getAttribute("degreesMap"));
    return modelAndView;
  }

  @RequestMapping("/viewQualifiedApplicants")
  public ModelAndView viewQualifiedAplcants(@RequestParam("jobId") String jobId, HttpServletRequest request) {
    System.out.println("viewQualifiedAplcants");

    Job job = jobDAO.fetchJob(jobId);
    List<Degree> degreesList = degreeDAO.getDegreesList();
    List<JobDegrees> jobDegrees = jobDAO.getJobDegrees(jobId);
    List<Applicant> applicantList = jobDAO.getQualifiedApplicants(job, degreesList, jobDegrees);
    ModelAndView modelAndView = new ModelAndView("qualifiedApplicants.jsp");
    modelAndView.addObject("employerId", request.getSession().getAttribute("empId"));
    modelAndView.addObject("employerName", request.getSession().getAttribute("empName"));
    modelAndView.addObject("jobList", request.getSession().getAttribute("jobList"));
    modelAndView.addObject("skillsMap", request.getSession().getAttribute("skillsMap"));
    modelAndView.addObject("degreesMap", request.getSession().getAttribute("degreesMap"));
    modelAndView.addObject("applicantList", applicantList);
    return modelAndView;
  }
}
