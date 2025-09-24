import 'package:biblioteca_app/controllers/livro_controller.dart';
import 'package:biblioteca_app/models/livro_model.dart';
import 'package:biblioteca_app/views/home_view.dart';
import 'package:flutter/material.dart';

class LivroFormView extends StatefulWidget {
  final LivroModel? livro;
  const LivroFormView({super.key, this.livro});

  @override
  State<LivroFormView> createState() => _LivroFormViewState();
}

class _LivroFormViewState extends State<LivroFormView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = LivroController();
  final _tituloField = TextEditingController();
  final _autorField = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.livro != null) {
      _tituloField.text = widget
          .livro!
          .titulo; //atribui o título do livro ao campo título do formulário
      _autorField.text = widget.livro!.autor;
    }
  }

  //criar usuário
  void _criar() async {
    if (_formKey.currentState!.validate()) {
      final livroNovo = LivroModel(
        id: DateTime.now().millisecond.toString(),
        titulo: _tituloField.text.trim(),
        autor: _autorField.text.trim(),
        disponivel: true,
      );
      try {
        await _controller.create(livroNovo);
      } catch (e) {
        //
      }
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    }
  }

  void _atualizar() async {
    if (_formKey.currentState!.validate()) {
      final livroAtualizado = LivroModel(
        id: widget.livro!.id, //id não altera
        titulo: _tituloField.text.trim(),
        autor: _autorField.text.trim(),
        disponivel: widget.livro!.disponivel,
      );
      try {
        await _controller.update(livroAtualizado);
        //mensagem para o usuário
      } catch (e) {
        //mensagem de erro
      }
      Navigator.pop(context); //volta para a tela anterior
      //abre a tela de usuário atualizando atela
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    }
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.livro == null ? "Novo Livro" : "Editar Livro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey, //responsável por validar o formulário
          child: Column(
            children: [
              TextFormField(
                controller: _tituloField,
                decoration: InputDecoration(labelText: "Titulo"),
                validator: (value) =>
                    value!.isEmpty ? "Informe o Titulo" : null,
              ),
              TextFormField(
                controller: _autorField,
                decoration: InputDecoration(labelText: "Autor"),
                validator: (value) => value!.isEmpty ? "Informe o Autor" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: widget.livro == null ? _criar : _atualizar,
                child: Text(widget.livro == null ? "Criar" : "Atualizar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
