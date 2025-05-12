class GenderEntity {
  final int? id;
  final String? createdAt;
  final String? name;

  GenderEntity({this.id, this.createdAt, this.name});
}

class GenderModel extends GenderEntity {
  GenderModel({super.name, super.id});

  factory GenderModel.fromJson(Map<String, dynamic> json) =>
      GenderModel(name: json['gender'], id: json['id']);

  Map<String, dynamic> toJson() => {'gender': name, 'id': id};
}
