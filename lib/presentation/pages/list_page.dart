import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_listcontatos_final/model/model_contatos.dart';
import 'package:projeto_listcontatos_final/presentation/controllers/contato_provider.dart';
import 'package:projeto_listcontatos_final/presentation/pages/cadastro_page.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ContatoProvider>();
    final contatos = controller.contatos;
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          backgroundColor: const Color.fromARGB(255, 175, 193, 223),
          title: Text(
            "Contatos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
      body: contatos.isEmpty
          ? Center(
              child: Text(
                "Nenhum contato cadastrado!",
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: contatos.length,
              itemBuilder: (context, index) {
                final contato = contatos[index];
                return Padding(
                  padding: EdgeInsetsGeometry.only(top: 18),
                  child: Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: contato.photopath.isNotEmpty
                            ? FileImage(File(contato.photopath))
                            : null,
                        child: contato.photopath.isEmpty
                            ? Text(contato.name[0].toUpperCase())
                            : null,
                      ),
                      title: Text(contato.email),
                      subtitle: Text(contato.phone),
                      trailing: IconButton(
                          onPressed: () {
                            controller.removerContato(contato);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final contato = await Navigator.push<ModelContatos>(
              context,
              MaterialPageRoute(
                builder: (_) => CadastroPage(),
              ));
          if (contato != null) {
            context.read<ContatoProvider>().adicionarContato(contato);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
