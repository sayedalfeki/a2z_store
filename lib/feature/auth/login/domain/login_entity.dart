/// statusMsg : "fail"
/// message : "Incorrect email or password"
/// errors : {"msg":"Email is required","param":"email","location":"body"}
/// user : {"name":"Sayed Hashem","email":"sayed@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZDU3YzlmNmVmMzMzYWFhMzAxODRmMyIsIm5hbWUiOiJTYXllZCBIYXNoZW0iLCJyb2xlIjoidXNlciIsImlhdCI6MTc0ODM1OTY5MywiZXhwIjoxNzU2MTM1NjkzfQ.vRxorVzLPJKNougPzkvaUixTby_Zwl1cZ_66nS93CAw"

class LoginEntity {
  LoginEntity({
      this.statusMsg, 
      this.message, 
      this.errors, 
      this.user, 
      this.token,});


  String? statusMsg;
  String? message;
  LoginErrors? errors;
  LoginUser? user;
  String? token;



}

/// name : "Sayed Hashem"
/// email : "sayed@gmail.com"
/// role : "user"

class LoginUser {
  LoginUser({
      this.name, 
      this.email, 
      });


  String? name;
  String? email;




}

/// msg : "Email is required"
/// param : "email"
/// location : "body"

class LoginErrors {
  LoginErrors({
      this.msg, 
      });


  String? msg;





}