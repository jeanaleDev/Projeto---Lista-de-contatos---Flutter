import 'package:hive/hive.dart';
part 'model_contatos.g.dart';

@HiveType(typeId: 0)
class ModelContatos extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String photopath;

  ModelContatos({
    required this.name,
    required this.email,
    required this.phone,
    this.photopath = '',
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "photopath": photopath,
    };
  }

  factory ModelContatos.fromJson(Map<String, dynamic> json) {
    return ModelContatos(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photopath: json['photopath'] ?? '',
    );
  }
}
