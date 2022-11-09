import 'package:api_cadastro/api/acesso_api.dart';
import 'package:api_cadastro/model/cidade.dart';
import 'package:api_cadastro/model/pessoa.dart';
import 'package:api_cadastro/util/componentes.dart';
import 'package:flutter/material.dart';


class ConsultaCidade extends StatefulWidget {
  const ConsultaCidade({Key? key }) : super(key: key);

  @override
  State<ConsultaCidade> createState() => _ConsultaState();
}

class _ConsultaState extends State<ConsultaCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Cidade> lista = [];

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodas() async {
      List<Cidade> cidades = await AcessoApi().listaCidades();
      setState(() {
        lista = cidades;
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
                      child: Componentes().criaItemCidade(lista[indice]),
                    );
                  }),
              ))
          ],
        ),
      ),
    );
  }
}