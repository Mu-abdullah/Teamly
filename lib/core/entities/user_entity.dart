class UserEntity {
  final int? id;
  final String? createAt;
  final String? name;
  final String? phone;
  final String? mail;
  final bool? verified;

  UserEntity({
    this.id,
    this.createAt,
    this.name,
    this.phone,
    this.mail,
    this.verified,
  });

  // @override
  // String toString() {
  //   return 'UserEntity{id: $id, name: $name, email: $email, phoneNumber: $phoneNumber}';
  // }
}
