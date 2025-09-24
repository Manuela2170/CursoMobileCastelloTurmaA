//converter Json <-> Dart

import 'dart:convert'; //não precisa instalar no pubspec / nativa do Dart

void main() {
  String jsonString = '''{
                    "id": "abc123",
                    "nome":"Pedro",
                    "idade": 25
                    "ativo": true
                    "login": "UserPedro",
                    "password": "1234"
                  }''';
  //decode jsonString
  Map<String, dynamic> usuario = json.decode(jsonString);

  print(usuario["nome"]); //Pedro
  print(usuario["login"]); // UserPedro

  //Modificar senha para 6 digitos / Salvar no jsonString

  usuario["password"] = "123456";

  //gravar no json

  jsonString = json.encode(usuario);

  print(jsonString);
}
