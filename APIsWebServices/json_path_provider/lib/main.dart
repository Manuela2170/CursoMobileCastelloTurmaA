import 'dart:convert';
import 'dart:io'; //pacote interno do dart (Manipulção de arquivos)

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(home: ProdutoPage()));
}

class ProdutoPage extends StatefulWidget {
  //construtor
  const ProdutoPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  List<Map<String, dynamic>> produtos = [];
  final TextEditingController _nomeProdutoController = TextEditingController();
  final TextEditingController _valorProdutoController = TextEditingController();

  //metodos
  @override
  void initState() {
    super.initState();
    _carregarProduto();
  }

  //métodos para conexão com arquivos da base de dados
  Future<File> getArquivos() async {
    final dir = await getApplicationDocumentsDirectory();
    return File("${dir.path}/produtos.json");
  }

  //métodos para carregar as informações da base de dados
  void _carregarProduto() async {
    try {
      final file = await getArquivos();
      String conteudo = await file.readAsString();
      //tentar salvar produto direto
      //produtos = json.decode(conteudo)
      List<dynamic> dados = json.decode(conteudo);
      setState(() {
        //converter a lista dinamca para lista de map
        // cast é um método que converte o tipo de dado
        // nesse caso converte de list<dynamic> para List <Map<String,dynamic>>
        produtos = dados.cast<Map<String, dynamic>>();
      });
    } catch (e) {
      setState(() {
        produtos = [];
      });
    }
  }

  // método para salvar
  void _salvarProdutos() async {
    try {
      final file = await getArquivos();
      String jsonProdutos = json.encode(produtos);
      await file.writeAsString(jsonProdutos);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lista de Produtos Salva com sucesso!")),
      );
    } catch (e) {
      print(e);
    }
  }

  //adiconar produto a lista
  void _adicionarProduto() {
    String nome = _nomeProdutoController.text.trim();
    String valorStr = _valorProdutoController.text.trim();
    if (nome.isEmpty || valorStr.isEmpty) return;
    //converter o str em double
    double? valor = double.tryParse(valorStr);
    if (valor == null) return;
    final novoProduto = {"nome": nome, "valor": valor};
    setState(() {
      produtos.add(novoProduto);
    });
    _nomeProdutoController.clear();
    _valorProdutoController.clear();
    _salvarProdutos();
  }

  //remover produto da lista
  void _removerProdutos(int index) {
    setState(() {
      produtos.removeAt(index);
    });
    _salvarProdutos();
  }

  //build da Tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Produtos")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeProdutoController,
              decoration: InputDecoration(labelText: "Nome do Produto"),
            ),
            TextField(
              controller: _valorProdutoController,
              decoration: InputDecoration(labelText: "valor (ex: 15.55)"),
              keyboardType: TextInputType.numberWithOptions(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _adicionarProduto,
              child: Text("Salvar Produto"),
            ),
            Divider(),
            Expanded(
              child: produtos.isEmpty
                  ? Center(child: Text("Nenhum Produto Salvo"))
                  : ListView.builder(
                      itemCount: produtos.length,
                      itemBuilder: (context, index) {
                        final produto = produtos[index];
                        return ListTile(
                          title: Text(produto["nome"]),
                          subtitle: Text("R\$ ${produto["valor"]}"),
                          trailing: IconButton(
                            onPressed: () => _removerProdutos(index),
                            icon: Icon(Icons.delete),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
