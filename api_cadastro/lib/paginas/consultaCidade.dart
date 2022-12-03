import 'package:api_cadastro/api/acesso_api.dart';
import 'package:api_cadastro/model/cidade.dart';
import 'package:api_cadastro/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConsultaCidade extends StatefulWidget {
  const ConsultaCidade({super.key});

  @override
  State<ConsultaCidade> createState() => _ConsultaCidadeState();
}

class _ConsultaCidadeState extends State<ConsultaCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Cidade> lista = [];
  TextEditingController txtUf = TextEditingController();
  

  @override
  Widget build(BuildContext context) {

    listarTodas() async {
      List<Cidade> pessoas = await AcessoApi().listaCidades();
      setState(() {
        lista = pessoas;
      });
    }

    @override
    void initState() {
      listarTodas();
      super.initState();
    }

    criaItemCidade(Cidade c, context) {
      return ListTile(
        title: Text('${c.id} - ${c.nome}/${c.uf}'),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, "/cadastroCidade",
                        arguments: c);
                  }),
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await AcessoApi().excluiCidade(c.id);
                    listarTodas();
                  }),
            ],
          ),
        ),
      );
    }


    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    buscarPorUf() async {
      List<Cidade> cidades = await AcessoApi().listaCidadesPorUf(txtUf.text);
      setState(() {
        lista = cidades;
      });
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Consulta de cidades", home, Colors.purple),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaInputTexto(TextInputType.text, "UF", txtUf, "Informe a UF"),
            Componentes().criaBotao(formController, buscarPorUf, "Buscar por UF"),
            Componentes().criaBotaoSemValidacao(listarTodas, "Listar todas"),
              Expanded(
                child: Container(
              child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, indice) {
                    return Card(
                      elevation: 6,
                      margin: const EdgeInsets.all(5),
                      child: criaItemCidade(lista[indice], context),
                    );
                  }),
            ))
          
          ],
        ),
      ),
    );
  }
}
