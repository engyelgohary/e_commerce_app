import 'package:e_commerce_app/domain/entites/RegisterResponseEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"engy@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDhmYzVkZDlkNzY2MDI3NWM1YmUzNyIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE2MDU5MjMwLCJleHAiOjE3MjM4MzUyMzB9.zz8nP0EeI4Vgy4mO3f4SXlhrkI180edbQ5a17pzavb0"

class RegisterResponseDto {
  RegisterResponseDto({
      this.message, 
      this.user, 
      this.token,
    this.statusMsg});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  RegisterResponseEntity toRegisterResponseEntity(){
    return RegisterResponseEntity(
      token: token,
      message: message,
      user: user?.toUserEntity(),
    );
  }

}

/// name : "Ahmed Abd Al-Muti"
/// email : "engy@gmail.com"
/// role : "user"

class UserDto {
  UserDto({
      this.name, 
      this.email, 
      this.role,});

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
UserEntity toUserEntity(){
    return UserEntity(email: email,name: name);
}
}