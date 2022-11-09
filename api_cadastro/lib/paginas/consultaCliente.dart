import 'package:api_cadastro/api/acesso_api.dart';
import 'package:api_cadastro/model/pessoa.dart';
import 'package:api_cadastro/util/componentes.dart';
import 'package:flutter/material.dart';


class ConsultaCliente extends StatefulWidget {
  const ConsultaCliente({Key? key }) : super(key: key);

  @override
  State<ConsultaCliente> createState() => _ConsultaState();
}

class _ConsultaState extends State<ConsultaCliente> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Pessoa> lista = [];

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodas() async {
      List<Pessoa> pessoas = await AcessoApi().listaPessoas();
      setState(() {
        lista = pessoas;
      });
      
    }
    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaBotao(formController, listarTodas, "Listar todas"),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, indice) {
                    return Card(
                      elevation: 6,
                      margin: const EdgeInsets.all(5),
                      child: Componentes().criaItemPessoa(lista[indice]),
                    );
                  }),
              ))
          ],
        ),
      ),
    );
  }
}