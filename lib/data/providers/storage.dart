import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

mixin Storage {
  static final _storage = FirebaseStorage.instance;

  // Operação de upload de arquivos para o Firebase Storage. Executa o
  // upload e retorna uma URL que permite o acesso ao arquivo remoto
  // por meio de algo como o Image.network.
  static Future<void> uploadThumb(String placeId, File image) async {
    final storageReference = _storage.ref(placeId);
    await storageReference.putFile(image);
  }

  // Operação de download de arquivos do Firebase Storage. Executa o
  // download para o caminho escolhido.
  static Future<String> getDownloadThumb(String placeId) async {
    final storageReference = _storage.ref(placeId);
    return await storageReference.getDownloadURL();
  }
}
