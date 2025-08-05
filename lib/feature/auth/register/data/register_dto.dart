
import '../domain/register_entity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedabukhaled@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MzRmMzZkODQ1N2FmYWE0ZWMwM2Q4OCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQ4MzAwNjU0LCJleHAiOjE3NTYwNzY2NTR9.HakdcYyerkKVH7pnzQevYhQeux1E6WWLzLVlFnFQ2Os"

class RegisterDto extends RegisterEntity {
  RegisterDto({
      super.message,
    super.statusMsg,
     this.userDto,
      super.token,
  this.errorDto
  });
 UserDto? userDto;
 RegisterErrorDto? errorDto;
  RegisterDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg=json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    errorDto=json['errors']!=null?RegisterErrorDto.fromJson(json['errors']):null;
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'statusmsg:$statusMsg\n message:$message';
  }

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['message'] = message;
  //   if (user != null) {
  //     map['user'] = userDto?.toJson();
  //   }
  //   map['token'] = token;
  //   return map;
  // }

}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedabukhaled@gmail.com"
/// role : "user"

class UserDto extends UserEntity {
  UserDto({
      super.name,
      super.email,
      this.role,});

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['name'] = name;
  //   map['email'] = email;
  //   map['role'] = role;
  //   return map;
  // }

}
class RegisterErrorDto extends RegisterErrorEntity {
  RegisterErrorDto({
    super.value,
    super.msg,
    super.param,
    super.location,});

  RegisterErrorDto.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }


  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['value'] = value;
  //   map['msg'] = msg;
  //   map['param'] = param;
  //   map['location'] = location;
  //   return map;
  // }

}