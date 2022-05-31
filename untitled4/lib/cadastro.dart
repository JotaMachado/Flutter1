import 'dart:convert';
import 'package:untitled4/variaveis.dart';

class Cadastro {
   String nome;
   String telefone;
   String email;

  Cadastro(this.nome,
      this.telefone,
      this.email,
      );

  @override
  String toString() {
    return 'Cadastro{nome: $nome, telefone: $telefone, email: $email}';
  }
}

