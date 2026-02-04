import 'package:flutter/widgets.dart';
import 'package:projeto_listcontatos_final/model/model_contatos.dart';
import 'package:projeto_listcontatos_final/repository/contatos_repository.dart';

class ContatoProvider extends ChangeNotifier {
  final _repository = ContatosRepository();
  List<ModelContatos> _contatos = [];
  List<ModelContatos> get contatos => _contatos;

  ContatosController() {
    carregarContatos();
  }

  void carregarContatos() {
    _contatos = _repository.getAll();
    notifyListeners();
  }

  Future<void> adicionarContato(ModelContatos contato) async {
    await _repository.add(contato);
    carregarContatos();
  }

  Future<void> removerContato(ModelContatos contato) async {
    await contato.delete();
    carregarContatos();
  }
}
