import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_listcontatos_final/model/model_contatos.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomectrl = TextEditingController();
  final emailctrl = TextEditingController();
  final phonectrl = TextEditingController();
  File? image;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile == null) return;
    setState(() => image = File(xfile.path));
  }

  void salvar() {
    final contato = ModelContatos(
        name: nomectrl.text,
        email: emailctrl.text,
        phone: phonectrl.text,
        photopath: image?.path ?? '');
    Navigator.pop(context, contato);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          "Cadastrar",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: const Color.fromARGB(255, 175, 193, 223),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: image != null ? FileImage(image!) : null,
                child: image == null
                    ? Icon(
                        Icons.camera_alt_rounded,
                        size: 40,
                      )
                    : null,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Card(
                child: TextFormField(
              controller: nomectrl,
              decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            )),
            Card(
                child: TextFormField(
              controller: emailctrl,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            )),
            Card(
              child: TextFormField(
                controller: phonectrl,
                decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  salvar();
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
