


class Admin{
  int id;
  String email;
  String password;
   String username;

  Admin({
    required this.id,
    required this.email,
    required this.password,
    required this.username

  });


factory Admin.fromJson(Map<String,dynamic> json)=>Admin(
  id:int.parse(json['id'].toString()) ,
  email:json['email'] ?? '', 
  username: json['username']?? '', 
  password: json['password'] ?? ''
  );


  Map<String,dynamic> toJson()=>{
    'id':id,
    'email':email,
    'password':password,
    'username':username
  };

 
}