class Cidade {
  int id;
  String nome;
  String uf;

  Cidade(this.id, this.nome, this.uf);

  factory Cidade.fromJson(dynamic json) {  // Json para objeto
    return Cidade(
        json["id"] as int, json["nome"] as String, json["uf"] as String);
  }

  Map<String, dynamic> toJson() => // Mapeamento para Json
      {if (id != 0) 'id': id, 'nome': nome, 'uf': uf};
}
