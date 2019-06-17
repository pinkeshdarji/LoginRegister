import 'package:json_annotation/json_annotation.dart';

part 'signup.g.dart';

@JsonSerializable()
class Signup {
  String email;
  String password;

  Signup({this.email, this.password});

  factory Signup.fromJson(Map<String, dynamic> json) => _$SignupFromJson(json);
  Map<String, dynamic> toJson() => _$SignupToJson(this);

//  Signup.fromJson(Map<String, dynamic> json) {
//    email = json['email'];
//    password = json['password'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['email'] = this.email;
//    data['password'] = this.password;
//    return data;
//  }
}
