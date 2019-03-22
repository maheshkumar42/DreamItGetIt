package com.comrench.Entity;

import java.io.Serializable;

public class LoginUser implements Serializable {

  private static final long serialVerionUID = 1L;
  private String emailId;
  private String password;
  private int userType = 1;

  public String getEmailId() {
    return emailId;
  }

  public void setEmailId(String emailId) {
    this.emailId = emailId;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public int getUserType() {
    return userType;
  }

  public void setUserType(int userType) {
    this.userType = userType;
  }

  @Override
  public String toString() {
    return "User [userType=" + userType + ", password=" + password + ", " + "Email_id=" + emailId + "]";
  }
}
