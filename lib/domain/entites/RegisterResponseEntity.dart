/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"engy@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDhmYzVkZDlkNzY2MDI3NWM1YmUzNyIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE2MDU5MjMwLCJleHAiOjE3MjM4MzUyMzB9.zz8nP0EeI4Vgy4mO3f4SXlhrkI180edbQ5a17pzavb0"

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.user, 
      this.token,});
  String? message;
  UserEntity? user;
  String? token;
}

/// name : "Ahmed Abd Al-Muti"
/// email : "engy@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email,});
  String? name;
  String? email;
}