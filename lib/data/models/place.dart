// Classe que representa um lugar.
// Seu id no banco de dados é gerado automaticamente

import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  // id do local
  String? id;

  // id do criador
  String creatorId;

  // Nome do local
  String name;

  // Localização exata, em coordenadas
  GeoPoint exactLocation;

  // Descrição textual da localização
  String address;

  // Descrição
  String description;

  // Público ou privado
  bool isPublic;

  // Categorias esportivas
  List<String> cathegories;

  // Foto principal
  // Armazenada como o caminho até a imagem no storage remoto
  String? thumbnail;

  // Demais fotos
  // Armazenadas como os caminhos até as imagens no storage remoto
  List<String>? pictures;

  // Nota, em meias-estrelas (0-10)
  int? rating;

  // Capacidade de pessoas
  int? capacity;

  Place(
      {required this.creatorId,
      required this.name,
      required this.exactLocation,
      required this.address,
      required this.description,
      required this.isPublic,
      required this.cathegories,
      this.id,
      this.capacity,
      this.pictures,
      this.thumbnail,
      this.rating});

  Map<String, dynamic> toJson() {
    return {
      'creatorId': creatorId,
      'name': name,
      'exact_location': exactLocation,
      'address': address,
      'description': description,
      'is_public': isPublic,
      'cathegories': cathegories,
      'thumbnail': thumbnail,
      'pictures': pictures,
      'capacity': capacity,
      'rating': rating ?? 10,
    };
  }

  static Place fromJson(Map<String, dynamic> map) {
    return Place(
      creatorId: map['creatorId'],
      name: map['name'],
      exactLocation: map['exact_location'],
      address: map['address'],
      description: map['description'],
      isPublic: map['is_public'],
      cathegories: map['cathegories'],
      thumbnail: map['thumbnail'],
      pictures:
          (map['thumbnail'] as List).map((item) => item as String).toList(),
      capacity: map['capacity'],
      rating: map['rating'],
    );
  }
}
