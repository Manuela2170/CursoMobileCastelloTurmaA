import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(MaterialApp(
    home: ImageScreen(),
  ));
}

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  // Lista para armazenar múltiplas imagens
  List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  // Método para captura de imagem pela câmera
  void _getImageFromCamera() async {
    final XFile? pickedFile = 
      await _picker.pickImage(source: ImageSource.camera);

    if(pickedFile != null){
      setState(() {
        // Adiciona a nova imagem à lista
        _images.add(File(pickedFile.path));
      });
    }
  }

  // Método para pegar uma imagem da Galeria
  void _getImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null){
      setState(() {
        // Adiciona a nova imagem à lista
        _images.add(File(pickedFile.path));
      });
    }
  }

  // Método para remover uma imagem da galeria
  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  // Método para visualizar imagem em tela cheia
  void _viewImageFullScreen(File image, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.file(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galeria de Imagens"),
        actions: [
          if (_images.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete_sweep),
              onPressed: () {
                setState(() {
                  _images.clear();
                });
              },
              tooltip: "Limpar todas as imagens",
            ),
        ],
      ),
      body: Column(
        children: [
          // Botões de adicionar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _getImageFromCamera, 
                  icon: Icon(Icons.camera_alt),
                  label: Text("Tirar Foto"),
                ),
                ElevatedButton.icon(
                  onPressed: _getImageFromGallery, 
                  icon: Icon(Icons.photo_library),
                  label: Text("Da Galeria"),
                ),
              ],
            ),
          ),
          
          // Contador de imagens
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total de imagens: ${_images.length}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                if (_images.isNotEmpty)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _images.clear();
                      });
                    },
                    child: Text(
                      "Limpar Todas",
                      style: TextStyle(color: const Color.fromARGB(255, 245, 130, 130)),
                    ),
                  ),
              ],
            ),
          ),
          
          // Grid de imagens
          Expanded(
            child: _images.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_library,
                          size: 80,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Nenhuma imagem na galeria",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Use os botões acima para adicionar imagens",
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 imagens por linha
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1, // Quadrado
                    ),
                    itemCount: _images.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          // Imagem
                          // Toque Simples
                          GestureDetector(
                            onTap: () => _viewImageFullScreen(_images[index], context),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: FileImage(_images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          
                          // Botão de remover
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () => _removeImage(index),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          
                          // Número da imagem
                          Positioned(
                            bottom: 4,
                            left: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
      
      // Botão flutuante para adicionar imagens
      floatingActionButton: FloatingActionButton(
        onPressed: _getImageFromGallery,
        child: Icon(Icons.add_photo_alternate),
        tooltip: "Adicionar imagem",
      ),
    );
  }
}