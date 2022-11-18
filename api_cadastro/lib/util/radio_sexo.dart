import 'package:api_cadastro/model/pessoa.dart';
import 'package:flutter/material.dart';

enum sexoEnum { masculino, feminino }

class RadioSexo extends StatefulWidget {
  TextEditingController? controller;
  RadioSexo({Key? key, this.controller}) : super(key: key);

  @override
  State<RadioSexo> createState() => _RadioSexoState();
}

class _RadioSexoState extends State<RadioSexo> {
  sexoEnum? _escolha = sexoEnum.masculino;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Pessoa;
    
    if (args != null) {
      _escolha = args.sexo == "M"? sexoEnum.masculino : sexoEnum.feminino;
    }
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: const Text('Masculino'),
            leading: Radio<sexoEnum>(
              value: sexoEnum.masculino,
              groupValue: _escolha,
              onChanged: (sexoEnum? value) {
                setState(() {
                  _escolha = value;
                  widget.controller?.text = 'M';
                });
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: const Text('Feminino'),
            leading: Radio<sexoEnum>(
                value: sexoEnum.feminino,
                groupValue: _escolha,
                onChanged: (sexoEnum? value) {
                  setState(() {
                    _escolha = value;
                    widget.controller?.text = 'F';
                  });
                }),
          ),
        )
      ],
    );
  }
}
