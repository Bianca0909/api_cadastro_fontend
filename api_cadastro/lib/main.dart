import 'package:api_cadastro/paginas/cadastroCliente.dart';
import 'package:api_cadastro/paginas/consultaCliente.dart';
import 'package:api_cadastro/paginas/home.dart';
import 'package:api_cadastro/util/tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema().criaTema(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/consultaCliente': (context) => const ConsultaCliente(),
        '/cadastroCliente': (context) => const CadastroCliente(),
        '/consultaCidade':(context) => const ConsultaCliente()
      },
    );
  }
}
