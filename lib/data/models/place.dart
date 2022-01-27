// Classe que representa um lugar.
// Seu id no banco de dados é gerado automaticamente

import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  // id do local
  String? id;

  // id do criador
  String creatorId;

  //Nome do local
  String name;

  // Endereço (trocar para um tipo geográfico)
  GeoPoint address;

  // Descrição
  String description;

  // Público ou privado
  bool isPublic;

  // Categorias esportivas
  List<String> cathegory;

  // Foto principal
  String? thumbnail;

  // Demais fotos
  List<String>? pictures;

  // Nota, em meias-estrelas (0-10)
  int? rating;

  // Capacidade de pessoas
  int? capacity;

  Place(
      {
      required this.creatorId,
      required this.name,
      required this.address,
      required this.description,
      required this.isPublic,
      required this.cathegory,
      this.id,
      this.capacity,
      this.pictures,
      this.thumbnail,
      this.rating});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'name': name,
      'address': address,
      'description': description,
      'is_public': isPublic,
      'cathegory': cathegory,
      'capacity': capacity,
      'rating': rating ?? 5,
    };
  }

  static Place fromJson(Map<String, dynamic> map) {
    return Place(
      id: map['id'],
      creatorId: map['creatorId'],
      name: map['name'],
      address: map['address'],
      description: map['description'],
      isPublic: map['is_public'],
      cathegory: map['cathegory'],
      capacity: map['capacity'],
      rating: map['rating'],
      // TODO carregar outros campos. Não sei ainda
      // como nós vamos lidar com os outros tipos diferenciados,
      // mas o meu palpite é de que eles teriam que ser convertidos em
      // strings. Vou trabalhar nisso em breve.
    );
  }
}
