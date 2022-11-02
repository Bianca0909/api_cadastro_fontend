import 'package:api_cadastro/api/acesso_api.dart';
import 'package:api_cadastro/model/cidade.dart';
import 'package:api_cadastro/model/pessoa.dart';
import 'package:api_cadastro/util/componentes.dart';
import 'package:api_cadastro/util/radio_sexo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSexo = TextEditingController();
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtCidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cadastrar() {
      Pessoa p = Pessoa(0, txtNome.text, txtSexo.text, int.parse(txtIdade.text),
          Cidade(int.parse(txtCidade.text), "", ""));
      AcessoApi().inserePessoa(p.toJson());
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }
    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaInputTexto(TextInputType.text, "Nome", txtNome, "informe o nome"),
            Componentes().criaInputTexto(TextInputType.number, "Idade", txtIdade, "informe o idade"),
            Center(child: RadioSexo(controller: txtSexo)),
            Center(child: RadioSexo(controller: txtCidade)),
            Componentes().criaBotao(formController, cadastrar, "cadastrar"),
          ],
        ),
      ),
    );
  }
}
