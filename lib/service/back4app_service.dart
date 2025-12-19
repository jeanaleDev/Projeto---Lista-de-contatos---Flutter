import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:projeto_listcontatos_final/model/model_contatos.dart';

class Back4appService {
  static const className = 'listacontatos';
  static Future<String?> uploadPhoto(File file) async {
    final parseFile = ParseFile(file);

    final response = await parseFile.save();
    if (response.success && parseFile.url != null) {
      return parseFile.url;
    }
    return null;
  }

  static Future<void> saveContato({
    required ModelContatos contato,
  }) async {
    final obj = ParseObject(className)
      ..set('name', contato.name)
      ..set('email', contato.email)
      ..set('phone', contato.phone)
      ..set('photopath', contato.photopath);
    final response = await obj.save();

    if (!response.success) {
      throw Exception(response.error?.message);
    }
  }
}
