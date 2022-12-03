import 'dart:convert';

import 'package:api_cadastro/model/cidade.dart';
import 'package:api_cadastro/model/pessoa.dart';
import 'package:http/http.dart';

class AcessoApi {
  
  Future<List<Pessoa>> listaPessoas() async {
    String url = 'http://localhost:8080/cliente';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Pessoa> pessoas = List<Pessoa>.from(l.map((p) => Pessoa.fromJson(p)));
    return pessoas;
  }

  Future<void> inserePessoa(Map<String, dynamic> pessoa) async {
    String url = 'http://localhost:8080/cliente';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await post(Uri.parse(url), headers: headers, body: json.encode(pessoa));
  }

  Future<void> alteraPessoa(Map<String, dynamic> pessoa, int id) async {
    String url = "http://localhost:8080/cliente?id=$id";
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    await put(Uri.parse(url), headers: headers, body: jsonEncode(pessoa));
  }

  Future<void> excluiPessoa(int id) async {
    String url = "http://localhost:8080/cliente/$id";
    await delete(Uri.parse(url));
  }

 Future<List<Pessoa>> listaPessoasPorCidade(int cidade) async {
    String url = 'http://localhost:8080/cliente/buscar-por-cidade/$cidade';
    Response resposta = await get(Uri.parse(url));
    print(resposta);
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Pessoa> pessoas = List<Pessoa>.from(l.map((p) => Pessoa.fromJson(p)));
    return pessoas;
  }

   Future<List<Cidade>> listaCidades() async {
    String url = 'http://localhost:8080/cidade';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cidade> cidades = List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

  Future<void> insereCidade(Map<String, dynamic> cidade) async {
    String url = 'http://localhost:8080/cidade';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await post(Uri.parse(url), headers: headers, body: json.encode(cidade));
  }

  Future<void> alteraCidade(Map<String, dynamic> cidade, int id) async {
    String url = "http://localhost:8080/cidade?id=$id";
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    await put(Uri.parse(url), headers: headers, body: jsonEncode(cidade));
  }

   Future<void> excluiCidade(int id) async {
    String url = "http://localhost:8080/cidade/$id";
    await delete(Uri.parse(url));
  }

 Future<List<Cidade>> listaCidadesPorUf(String uf) async {
    String url = 'http://localhost:8080/cidade/buscar-por-uf/$uf';
    print(url);
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cidade> cidades = List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

}
