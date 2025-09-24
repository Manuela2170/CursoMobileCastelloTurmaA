import 'package:biblioteca_app/controllers/empestimo_controller.dart';
import 'package:biblioteca_app/models/emprestimo_model.dart';
import 'package:flutter/material.dart';

class EmprestimoFormView extends StatefulWidget {
  final EmprestimoModel? emprestimo;

  const EmprestimoFormView({super.key, this.emprestimo});

  @override
  State<EmprestimoFormView> createState() => _EmprestimoFormViewState();
}

class _EmprestimoFormViewState extends State<EmprestimoFormView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = EmprestimoController();
  final _usuarioField = TextEditingController();
  final _livroField = TextEditingController();
  final _dataEmprestimoField = TextEditingController();
  final _dataDevolucaoField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
