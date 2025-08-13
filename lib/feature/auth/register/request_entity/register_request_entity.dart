/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttii4012@gmail.com"
/// password : "Ahmed@123"
/// rePassword : "Ahmed@123"
/// phone : "01010700701"
class RegisterRequestEntity {
  RegisterRequestEntity({
    this.name,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;
  RegisterRequestEntity.fromJson(Map<String,dynamic> json)
  {
    print('json is $json');
    name=json['name'];
    email=json['email'];
    password=json['password'];
    phone=json['phone'];
    rePassword=json['rePassword'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    return map;
  }
  @override
  String toString() {
    return "{'name':$name,'email':$email,'password':$password,'phone':$phone}";
  }
}
