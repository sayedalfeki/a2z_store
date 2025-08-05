class ForgetPassWordEntity
{
  String? statusMessage;
  String? message;
  String? status;
  String? token;
  ForgetPassWordEntity(this.statusMessage, this.message,this.status,this.token);
  ForgetPassWordEntity.fromJson(dynamic json)
  {
      statusMessage=json['statusMsg'];
      message=json['message'];
      status=json['status'];
      token=json['token'];
  }
}