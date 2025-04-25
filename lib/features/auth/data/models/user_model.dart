import '../../../../core/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.email,
    super.role,
    super.createdAt,
    super.id,
    super.userId,
    super.uid,
    super.compnay,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      role: json['role'],
      createdAt: json['created_at'],
      id: json['id'],
      userId: json['user_id'],
      uid: json['uid'],
      compnay: json['company'] ?? json['compnay'],
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'role': role,
    'created_at': createdAt,
    'id': id,
    'user_id': userId,
    'uid': uid,
    'company': compnay,
  };
}
