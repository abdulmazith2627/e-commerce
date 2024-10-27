


class Users{
  String email;
  String password;
   String username;

  Users({

    required this.email,
    required this.password,
    required this.username

  });


factory Users.fromJson(Map<String,dynamic> json)=>Users(
  email:json['email'] ?? '', 
  username: json['username']?? '', 
  password: json['password'] ?? ''
  );


  Map<String,dynamic> toJson()=>{
    'email':email,
    'password':password,
    'username':username
  };

 
}