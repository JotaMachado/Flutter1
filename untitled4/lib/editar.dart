
import 'package:flutter/material.dart';
import 'package:untitled4/cadastro.dart';
import 'package:untitled4/lista.dart';
import 'package:untitled4/variaveis.dart';

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

class EditarContato extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController(text: contatos[globalIndex].nome);
  final TextEditingController _controladorTelefone = TextEditingController(text: contatos[globalIndex].telefone);
  final TextEditingController _controladorEmail = TextEditingController(text: contatos[globalIndex].email);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Editar Contato'),
            backgroundColor: Colors.black,
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
                  child: TextField(controller: _controladorNome,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child:
                  TextField( controller: _controladorTelefone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField( controller: _controladorEmail,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),),
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(
                  Icons.save,
                ),
                backgroundColor: Colors.blue,
                onPressed: (){
                  final String nome = _controladorNome.text;
                  final String telefone = _controladorTelefone.text;
                  final String email = _controladorEmail.text;
                  final  contato = Cadastro(nome, telefone, email);
                  contatos[globalIndex].nome = nome;
                  contatos[globalIndex].telefone = telefone;
                  contatos[globalIndex].email = email;
                  _controladorNome.text = "";
                  _controladorTelefone.text = "";
                  _controladorEmail.text = "";
                },
              ),
              FloatingActionButton(
                child: Icon(
                  Icons.delete,
                ),
                backgroundColor: Colors.blue,
                onPressed: (){
                  contatos.removeAt(globalIndex);
                  _controladorNome.text = "";
                  _controladorTelefone.text = "";
                  _controladorEmail.text = "";
                },
              ),
            ],)
      ),
    );
  }
}

