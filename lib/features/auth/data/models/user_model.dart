import 'dart:convert';

import '../../../../core/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.email,
    super.role,
    super.uid,
    super.firstName,
    super.lastName,
    super.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'] as String,
    email: json['email'] as String,
    role: json['role'] as String,
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    phone: json['phone'] as String?,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uid': uid,
    'email': email,
    'role': role,
    'first_name': firstName,
    'last_name': lastName,
    'phone': phone,
  };

  // Add fromJsonString method for easier string parsing
  static UserModel fromJsonString(String jsonString) {
    return UserModel.fromJson(json.decode(jsonString));
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}
