/// message : "success"
/// user : {"name":"Ahmed","email":"ahmed.sayed@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MzRlOWFmODQ1N2FmYWE0ZWMwMDdhZCIsIm5hbWUiOiJBaG1lZCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQ4Mjk4MTYwLCJleHAiOjE3NTYwNzQxNjB9.q5Ap6OUSD1gy_jQgZ5HdditdS6q1LjkDSq3kGiH_bf8"

class RegisterEntity {
  RegisterEntity({
      this.message, 
      this.user, 
      this.token,this.statusMsg,this.error});
  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;
  RegisterErrorEntity? error;
}

/// name : "Ahmed"
/// email : "ahmed.sayed@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      });
  String? name;
  String? email;

}
class RegisterErrorEntity {
  RegisterErrorEntity({
    this.value,
    this.msg,
    this.param,
    this.location,});


  String? value;
  String? msg;
  String? param;
  String? location;



}