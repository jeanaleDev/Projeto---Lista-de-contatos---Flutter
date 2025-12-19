import 'dart:io';

import 'package:hive/hive.dart';
import 'package:projeto_listcontatos_final/model/model_contatos.dart';
import 'package:projeto_listcontatos_final/service/back4app_service.dart';

class ContatosRepository {
  final box = Hive.box<ModelContatos>('contatos');

  List<ModelContatos> getAll() {
    return box.values.toList();
  }

  Future<void> add(ModelContatos contato) async {
    await box.add(contato);

    if (contato.photopath.isNotEmpty && !contato.photopath.startsWith('http')) {
      await syncContato(contato);
    }
  }

  Future<void> syncContato(ModelContatos contato) async {
    try {
      final file = File(contato.photopath);
      if (!file.existsSync()) return;
      final url = await Back4appService.uploadPhoto(file);
      if (url == null) return;
      contato.photopath = url;
      await contato.save();
      await Back4appService.saveContato(contato: contato);
    } catch (_) {}
  }
}

Future<void> deleteContato(ModelContatos contato) async {
  await deleteContato(contato);
}
