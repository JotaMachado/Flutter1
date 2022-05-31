import 'package:untitled4/cadastro.dart';
import 'package:untitled4/editar.dart';
import 'package:untitled4/main.dart';
import 'package:untitled4/variaveis.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('New Screen')
      ),
      body: ListView.builder(
              itemCount: contatos.length,
              itemBuilder: (context, index) {
                return Card(
                  child:ListTile(
                    onTap: () {
                      globalIndex = index;
                    },
                    title: Text(contatos[index].nome),
                    subtitle: Text(contatos[index].telefone)
                  )
                );
              },
            ),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(
                  Icons.add,
                ),
                backgroundColor: Colors.black,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
              FloatingActionButton(
                child: Icon(
                  Icons.edit,
                ),
                backgroundColor: Colors.black,
                onPressed: (){
                  if(contatos.length == 0 || contatos.first == null){
                    print('Escolha um contato!');
                  }else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditarContato()),
                    );
                  }
                },
              ),
            ]
        )
    );
  }
}

