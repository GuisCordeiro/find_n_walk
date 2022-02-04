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
  // Se true, a imagem está armazenada sob
  // o nome do id do lugar no storage remoto.
  bool hasThumb;

  // Capacidade de pessoas
  int? capacity;

  Place({
    required this.creatorId,
    required this.name,
    required this.exactLocation,
    required this.address,
    required this.description,
    required this.isPublic,
    required this.cathegories,
    required this.hasThumb,
    this.id,
    this.capacity,
  });

  Map<String, dynamic> toJson() {
    return {
      'creatorId': creatorId,
      'name': name,
      'exact_location': exactLocation,
      'address': address,
      'description': description,
      'is_public': isPublic,
      'cathegories': cathegories,
      'has_thumb': hasThumb,
      'capacity': capacity,
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
      cathegories:
          (map['cathegories'] as List).map((item) => item as String).toList(),
      hasThumb: map['has_thumb'],
      capacity: map['capacity'],
    );
  }
}
