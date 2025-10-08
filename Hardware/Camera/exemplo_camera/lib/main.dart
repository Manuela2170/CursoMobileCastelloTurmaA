import 'dart:io';
import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(home: ImageScreen()));
}

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  //instalar a biblioteca image_picker
  File? _image; // obj para armazenar informações de um arquivo do dispositivo
  final ImagePicker _picker = ImagePicker();

  //método para captura de imagem pela camera
  void _getImageFromCamera() async {
    //abre a camera e tira uma foto
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );

    //verifica se a imagem não é null
    if (pickedFile != null) {
      setState(() {
        //transfere o caminho para o arquivo _image
        _image = File(pickedfile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
