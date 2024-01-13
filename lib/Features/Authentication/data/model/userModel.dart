class UserModel{
  late String name;
  late String email;
  late String phone;
  late String uId;
 // late String? image;

  UserModel({
    required this.email,
    required this.phone,
    required this.name,
    required this.uId,
   // this.image ,
  });

  UserModel.fromJson(Map<String , dynamic>  json){
    name = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
   // image = json['image'];
  }
  Map<String , dynamic> toMap(){
    return{
      'fullName':name,
      'email':email,
      'phone':phone,
      'uId':uId,
    // 'image':image,
    };
  }

}