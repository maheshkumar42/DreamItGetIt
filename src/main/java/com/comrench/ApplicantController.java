package com.comrench;

import com.comrench.DAO.ApplicantDAO;
import com.comrench.DAO.CompanyDAO;
import com.comrench.DAO.DegreeDAO;
import com.comrench.Entity.Applicant;
import com.comrench.Entity.ApplicantDegrees;
import com.comrench.Entity.Degree;
import com.comrench.Entity.Job;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class ApplicantController {

  @Autowired
  private DegreeDAO degreeDAO;

  @Autowired
  private ApplicantDAO applicantDAO;

  @Autowired
  private CompanyDAO companyDAO;

  // Called when job seeker applies for the job
  @RequestMapping("/applyJob.htm")
  public ModelAndView applyJob(@RequestParam("jobId") String jobId, @RequestParam("applicantId") String applicantId, HttpServletRequest request){
    //String applicantId = (String) request.getSession().getAttribute("applicantId");
    applicantDAO.applyJob(applicantId, jobId);

    List<Degree> degreesList = degreeDAO.getDegreesList();
    Applicant applicant = applicantDAO.getApplicant(applicantId);
    List<ApplicantDegrees> applDegrees = applicantDAO.getApplicantDegrees(applicantId);
    Map<Long, String> employerInfo = companyDAO.getEmployerInfoMap();
    List<Job> jobList = applicantDAO.getQualifiedJobs(applicant, degreesList, applDegrees, employerInfo);
    List<Job> appliedJobs = applicantDAO.getAppliedJobs("" + applicant.getApplicantId());
    ModelAndView modelAndView = new ModelAndView("applicantHome.jsp");
    modelAndView.addObject("applicantId", applicant.getApplicantId());
    modelAndView.addObject("applicantName", applicant.getFirstName());
    modelAndView.addObject("jobList", jobList);
    modelAndView.addObject("appliedJobs", appliedJobs);
    modelAndView.addObject("skillsMap", request.getSession().getAttribute("skillsMap"));
    modelAndView.addObject("degreesMap", request.getSession().getAttribute("degreesMap"));
    modelAndView.addObject("employerInfoList", applicant.getEmployerInfoList());
    return modelAndView;
  }

  // Retries list of jobs applied by the applicant
  @RequestMapping("/appliedJobs.htm")
  public ModelAndView viewAppliedJobs(HttpServletRequest request){
    List<Job> appliedJobs = applicantDAO.getAppliedJobs((String) request.getSession().getAttribute("applicantId"));
    Map<Long, String> employerInfoList = companyDAO.getEmployerInfoMap();
    ModelAndView modelAndView = new ModelAndView("applicantHome.jsp");
    modelAndView.addObject("applicantId", request.getSession().getAttribute("applicantId"));
    modelAndView.addObject("applicantName", request.getSession().getAttribute("applicantName"));
    modelAndView.addObject("jobList", request.getSession().getAttribute("jobList"));
    modelAndView.addObject("skillsMap", request.getSession().getAttribute("skillsMap"));
    modelAndView.addObject("degreesMap", request.getSession().getAttribute("degreesMap"));
    modelAndView.addObject("appliedJobs", appliedJobs);
    modelAndView.addObject("employerInfoList", employerInfoList);
    return modelAndView;
  }
}
