import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

mixin Storage {
  static final _storage = FirebaseStorage.instance;

  // Operação de upload de arquivos para o Firebase Storage. Executa o
  // upload e retorna uma URL que permite o acesso ao arquivo remoto
  // por meio de algo como o Image.network.
  static Future<String> uploadFile(File localPath, String storagePath) async {
    final storageReference = _storage.ref(storagePath);
    final task = storageReference.putFile(localPath);
    try {
      await task;
    } on FirebaseException {
      print(task.snapshot);
    }
    return storageReference.getDownloadURL();
  }

  // Operação de download de arquivos do Firebase Storage. Executa o
  // download para o caminho escolhido.
  static Future<void> downloadFile(File localPath, String storagePath) async {
    await _storage.ref(storagePath).writeToFile(localPath);
  }
}
