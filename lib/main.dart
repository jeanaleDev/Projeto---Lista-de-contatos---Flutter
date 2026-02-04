import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:projeto_listcontatos_final/model/model_contatos.dart';
import 'package:projeto_listcontatos_final/presentation/controllers/contato_provider.dart';
import 'package:projeto_listcontatos_final/presentation/pages/list_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ModelContatosAdapter());
  await Hive.openBox<ModelContatos>('contatos');

  await Parse().initialize('YzUIQZBKkwvIdXltJ5HdKdVBv4riV2xNoTIpl5El',
      'https://parseapi.back4app.com',
      clientKey: 'VckW7d7FaPDY2yM4V2ZcaC9MB1ukGDS7ObGQSvQx',
      autoSendSessionId: true);

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ContatoProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFD6BAEE)),
      home: ListPage(),
    );
  }
}
