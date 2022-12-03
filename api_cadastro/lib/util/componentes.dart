import 'package:api_cadastro/model/cidade.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Componentes {
  criaAppBar(texto, acao, cor) {
    return AppBar(
      title: criaTexto(texto),
      centerTitle: true,
      backgroundColor: cor,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: acao,
        ),
      ],
    );
  }

  criaTexto(texto, [cor]) {
    if (cor != null) {
      return Text(
        texto,
        style: TextStyle(color: cor),
      );
    }
    return Text(texto);
  }

  iconButton() {
    return const Icon(
      Icons.maps_home_work_outlined,
      size: 180.0,
    );
  }

  criaInputTexto(tipoTeclado, textoEtiqueta, controlador, msgValidacao) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: tipoTeclado,
        decoration: InputDecoration(
          labelText: textoEtiqueta,
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 30),
        controller: controlador,
        validator: (value) {
          if (value!.isEmpty) {
            return msgValidacao;
          }
        },
      ),
    );
  }

  criaBotao(controladorFormulario, funcao, titulo) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10), backgroundColor: Colors.purple, 
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0))),
              onPressed: () {
                if (controladorFormulario.currentState!.validate()) {
                  funcao();
                }
              },
              child: Text(
                titulo,
                style: const TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  criaBotaoSemValidacao(funcao, titulo) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10), backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0))),
              onPressed: () {
                funcao();
              },
              child: Text(
                titulo,
                style: const TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  criaContainerDados(rua, complemento, bairro, cidade, estado) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }

  criaItemCidade(Cidade c) {
    return ListTile(
      title: criaTexto("${c.nome} - ${c.uf}"),
    );
  }
}
