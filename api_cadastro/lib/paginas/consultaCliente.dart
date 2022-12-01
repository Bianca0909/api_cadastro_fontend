import 'package:api_cadastro/api/acesso_api.dart';
import 'package:api_cadastro/model/cidade.dart';
import 'package:api_cadastro/model/pessoa.dart';
import 'package:api_cadastro/util/componentes.dart';
import 'package:flutter/material.dart';

import '../util/combo_cidade.dart';

class ConsultaCliente extends StatefulWidget {
  const ConsultaCliente({Key? key}) : super(key: key);

  @override
  State<ConsultaCliente> createState() => _ConsultaState();
}

class _ConsultaState extends State<ConsultaCliente> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtCidade = TextEditingController();
  
  List<Pessoa> lista = [];

  @override
  Widget build(BuildContext context) {
    listarTodas() async {
      List<Pessoa> pessoas = await AcessoApi().listaPessoas();
      setState(() {
        lista = pessoas;
      });
    }

    @override
    void initState() {
      listarTodas();
      super.initState();
    }

    criaItemPessoa(Pessoa p, context) {
      String sexo = p.sexo == 'M'? "Masculino" : "Feminino";
      return ListTile(
        title: Text('${p.id} - ${p.nome}'),
        subtitle: Text('${sexo} - (${p.cidade.nome}/${p.cidade.uf})'),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, "/cadastroCliente",
                        arguments: p);
                  }),
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await AcessoApi().excluiPessoa(p.id);
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
    
    buscarPorCidade() async {

      List<Pessoa> pessoas = await AcessoApi().listaPessoasPorCidade(int.parse(txtCidade.text));
      setState(() {
        lista = pessoas;
      });
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Consulta de clientes", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
             Center(child: ComboCidade(controller: txtCidade)),
            Componentes().criaBotao(formController, buscarPorCidade, "Buscar por cidade"),
            Componentes().criaBotao(formController, listarTodas, "Listar todas"),
            Expanded(
                child: Container(
              child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, indice) {
                    return Card(
                      elevation: 6,
                      margin: const EdgeInsets.all(5),
                      child: criaItemPessoa(lista[indice], context),
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
