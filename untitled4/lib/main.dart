import 'package:flutter/material.dart';
import 'package:untitled4/cadastro.dart';
import 'package:untitled4/lista.dart';
import 'package:untitled4/variaveis.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
    );
  }
}

class SecondRoute extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Contatos'),
          leading: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: TextField( controller: _controladorNome,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:'Nome'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child:
                TextField( controller: _controladorTelefone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:'Telefone'
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: TextField( controller: _controladorEmail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:'E-mail'
                   ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.save,
          ),
          onPressed: (){
            final String nome = _controladorNome.text;
            final String telefone = _controladorTelefone.text;
            final String email = _controladorEmail.text;
            final contato = Cadastro(nome, telefone, email);
            final cadastrosjson = json.encode(contatos);
            final cadastros = json.decode(cadastrosjson);
            contatos.add(contato);
            _controladorNome.text = '';
            _controladorEmail.text = '';
            _controladorTelefone.text = '';
          },
        ),
      ),
    );
  }
}
