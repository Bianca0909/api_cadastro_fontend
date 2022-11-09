import 'package:api_cadastro/util/componentes.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    cadastroCliente() {
      Navigator.of(context).pushReplacementNamed('/cadastroCliente');
    }

    consultaCliente() {
      Navigator.of(context).pushReplacementNamed('/consultaCliente');
    }

     cadastroCidade() {
      Navigator.of(context).pushReplacementNamed('/cadastroCidade');
    }

    consultaCidade() {
      Navigator.of(context).pushReplacementNamed('/consultaCidade');
    }


    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaBotao(formController, cadastroCliente, "Cadastro Pessoa"),
            Componentes().criaBotao(formController, consultaCliente, "Consulta Pessoa"),
            Componentes().criaBotao(formController, consultaCidade, "Consulta Cidade"),
            Componentes().criaBotao(formController, cadastroCidade, "Cadastro Cidade")
          ],
        )),

    );
  }
}