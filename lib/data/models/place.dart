import 'dart:io';

class Place {
  //Nome do local
  String name;

  //Local (trocar para "Location" ou outra classe que suporte cordenadas geográficas)
  String address;

  //Descrição do local
  String description;

  //Público (true) ou Privado (false)
  bool isPublic;

  //Categorias esportivas
  List<String> cathegory;

  //foto principal
  File? thumbnail;

  //fotos do local
  List<File>? pictures;

  //Nota do local --> 1 a 10 metades de estrela
  int? rating;

  //Capacidade de pessoas
  int capacity;

  Place(
      {required this.name,
      required this.address,
      required this.description,
      required this.isPublic,
      required this.cathegory,
      required this.capacity,
      this.pictures,
      this.thumbnail,
      this.rating});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'description': description,
      'is_public': isPublic,
      'cathegory': cathegory,
      'capacity': capacity,
      'rating': rating ?? 5,
    };
  }

  // NOTE esse monte de ?? serve para contornar
  // a exigência do dart de que tudo seja null-safe, mas,
  // na prática, nenhum deles deveria ser acionado. Isso
  // porque os mapas que serão passados para essa função
  // deveriam ser produzidos pela função acima, que não
  // deixa nenhum campo faltando.
  static Place fromMap(Map<String, dynamic> map) {
    return Place(
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
