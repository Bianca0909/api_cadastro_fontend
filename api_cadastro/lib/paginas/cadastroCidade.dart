import 'package:api_cadastro/api/acesso_api.dart';
import 'package:api_cadastro/model/cidade.dart';
import 'package:api_cadastro/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CadastroCidade extends StatefulWidget {
  const CadastroCidade({super.key});

  @override
  State<CadastroCidade> createState() => _CadastroCidadeState();
}

class _CadastroCidadeState extends State<CadastroCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtUf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Cidade;
    txtNome.text = args.nome;
    txtUf.text = args.uf;

    salvar() async {
      Cidade c = Cidade(args.id, txtNome.text, txtUf.text);
      if (c.id == 0) {
        await AcessoApi().insereCidade(c.toJson());
      } else {
      AcessoApi().alteraCidade(c.toJson(), c.id);
      }
      Navigator.of(context).pushNamed('/consultaCidade');
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Cadastro de cidades", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaInputTexto(
                TextInputType.text, "Nome", txtNome, "informe o nome"),
            Componentes().criaInputTexto(
                TextInputType.number, "UF", txtUf, "informe a unidade federal"),
            Componentes().criaBotao(formController, salvar, "Cadastrar")
          ],
        ),
      ),
    );
  }
}
