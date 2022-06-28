class User{
  late String? id ;
  late String? firstName ;
  late String? lastName ;
  late int? phone ;
  late String? address ;
  late String? job;

  User({this.id='' , required this.firstName,required this.lastName,required this.phone,required this.address,required this.job});
Map<String ,dynamic >toJson(){
  return{
    'id':id,
    'firstName':firstName,
    'lastName':lastName,
    'phone':phone,
    'address':address,
    'job':job
  };
}
factory User.FromJson(Map<String , dynamic> json){
  return User(firstName: json['firstName'], lastName: json['lastName'], phone: json['phone'], address: json['address'], job: json['job']);
}
}