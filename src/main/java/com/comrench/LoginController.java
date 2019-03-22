package com.comrench;

import com.comrench.DAO.ApplicantDAO;
import com.comrench.DAO.CompanyDAO;
import com.comrench.DAO.CustomRepository;
import com.comrench.DAO.DegreeDAO;
import com.comrench.DAO.JobDAO;
import com.comrench.DAO.SkillDAO;
import com.comrench.Entity.Applicant;
import com.comrench.Entity.ApplicantDegrees;
import com.comrench.Entity.ApplicantSkills;
import com.comrench.Entity.Company;
import com.comrench.Entity.Degree;
import com.comrench.Entity.Job;
import com.comrench.Entity.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController {

  @Autowired
  private CompanyDAO companyDAO;

  @Autowired
  private ApplicantDAO applicantDAO;

  @Autowired
  private CustomRepository repo;

  @Autowired
  private JobDAO jobDAO;

  @Autowired
  private DegreeDAO degreeDAO;

  @Autowired
  private SkillDAO skillDAO;

  @RequestMapping("/subscribe.htm")
  public String subscribeApplicant() {
    return "subscribe.jsp";
  }

  @RequestMapping("/register.htm")
  public String register() {
    return "registerClient.jsp";
  }

  // Authenticates a user
  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public ModelAndView login(@ModelAttribute("loginuser") LoginUser user, BindingResult result, ModelMap model) {

    ModelAndView modelAndView;
    if (result.hasErrors()) {
      modelAndView = new ModelAndView("error.jsp");
      return modelAndView;
    }

    // Applicant related operations
    if (user.getUserType() == 1) {
      Applicant applicant = repo.authenticateApplicant(user);

      if (applicant != null) {
        List<Degree> degreesList = degreeDAO.getDegreesList();
        Map<Long, String> skillsMap = skillDAO.getSkillsMap(null);
        Map<Long, String> degreesMap = degreeDAO.getDegreesMap(degreesList);
        List<ApplicantDegrees> applDegrees = applicantDAO.getApplicantDegrees("" + applicant.getApplicantId());
        Map<Long, String> employerInfo = companyDAO.getEmployerInfoMap();
        List<Job> jobList = applicantDAO.getQualifiedJobs(applicant, degreesList, applDegrees, employerInfo);
        List<Job> appliedJobs = applicantDAO.getAppliedJobs("" + applicant.getApplicantId());
        modelAndView = new ModelAndView("applicantHome.jsp");
        modelAndView.addObject("applicantId", applicant.getApplicantId());
        modelAndView.addObject("applicantName", applicant.getFirstName());
        modelAndView.addObject("jobList", jobList);
        modelAndView.addObject("appliedJobs", appliedJobs);
        modelAndView.addObject("skillsMap", skillsMap);
        modelAndView.addObject("degreesMap", degreesMap);
        modelAndView.addObject("employerInfoList", applicant.getEmployerInfoList());
      } else {
        modelAndView = new ModelAndView("index.jsp");
      }
      return modelAndView;
    }

    // Employer related operations
    else {
      Company company = repo.authenticateEmployer(user);

      if (company != null) {
        List<Job> jobList = jobDAO.fetchEmployerJobs(company.getEmployerID());
        Map<Long, String> skillsMap = skillDAO.getSkillsMap(null);
        Map<Long, String> degreesMap = degreeDAO.getDegreesMap(null);
        modelAndView = new ModelAndView("employerHome.jsp");
        modelAndView.setViewName("employerHome.jsp");
        modelAndView.addObject("employerId", company.getEmployerID());
        modelAndView.addObject("employerName", company.getName());
        modelAndView.addObject("jobList", jobList);
        modelAndView.addObject("skillsMap", skillsMap);
        modelAndView.addObject("degreesMap", degreesMap);
        System.out.println("done");
      } else {
        modelAndView = new ModelAndView("index.jsp");
      }
      return modelAndView;
    }
  }

  // Adds a new client or employer to database
  @RequestMapping(value = "/registerClient", method = RequestMethod.POST)
  public ModelAndView registerClient(@ModelAttribute("company") Company company, BindingResult result, ModelMap model) {
    if (result.hasErrors()) {
      ModelAndView modelAndView = new ModelAndView("error.jsp");
      return modelAndView;
    }

    boolean isExistingClient = companyDAO.isExistingClient(company.getEmailId());

    if (isExistingClient) {
      ModelAndView modelAndView = new ModelAndView("error.jsp");
      return modelAndView;
    }

    boolean status = companyDAO.registerCompany(company);

    if (!status) {
      ModelAndView modelAndView = new ModelAndView("error.jsp");
      return modelAndView;
    }

    ModelAndView modelAndView = new ModelAndView("index.jsp");
    modelAndView.addObject("signUpStatus", "Success");
    return modelAndView;
  }

  // Subscribes a new applicant
  @RequestMapping(value = "/subscribeApplicant", method = RequestMethod.POST)
  public ModelAndView subscribeApplicant(@ModelAttribute("applicant") Applicant applicant, BindingResult result,
                                         ModelMap model) {

    System.out.println("Subscribe Applicant");
    System.out.println(applicant);
    if (result.hasErrors()) {
      ModelAndView modelAndView = new ModelAndView("error.jsp");
      System.out.println("Returning as results has errors");
      return modelAndView;
    }

    List<ApplicantSkills> newas = new ArrayList<ApplicantSkills>();
    List<ApplicantDegrees> newds = new ArrayList<ApplicantDegrees>();
    // Clean Applicant Skills before insert
    for (ApplicantSkills as : applicant.getApplicantSkills()) {
      if (as.getSkillId() != 0)
        newas.add(as);
    }

    applicant.setApplicantSkills(newas);
    System.out.println(applicant);

    // Clean Applicant Degrees
    for (ApplicantDegrees ds : applicant.getApplicantDegrees()) {
      System.out.println(ds);
      if (ds.getDegreeId() != 0)
        newds.add(ds);
    }

    if(newds.isEmpty() || newas.isEmpty())
    {
      ModelAndView modelAndView = new ModelAndView("error.jsp");
      System.out.println(Arrays.toString(newds.toArray()));
      System.out.println(Arrays.toString(newas.toArray()));
      System.out.println("skill or degree empty ..Error so returning");
      return modelAndView;
    }

    applicant.setApplicantDegrees(newds);

    System.out.println(applicant);

    boolean isExistingAppl = applicantDAO.isExistingApplicant(applicant.getEmailId());

    if (isExistingAppl)
    {
      ModelAndView modelAndView = new ModelAndView("error.jsp");
      System.out.println("Existing applicant so returning ");
      return modelAndView;
    }

    System.out.println("Starting subscription");
    boolean status = applicantDAO.subscribeApplicant(applicant);
    System.out.println("Subscription status: "+status);

    if (!status)
    {
      ModelAndView modelAndView = new ModelAndView("error.jsp");
      System.out.println("Subscription failed.");
      return modelAndView;
    }

    System.out.println("Subscription success");
    ModelAndView modelAndView = new ModelAndView("index.jsp");
    modelAndView.addObject("signUpStatus", "Success");
    return modelAndView;
  }
}
