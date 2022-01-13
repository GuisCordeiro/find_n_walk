// ignore_for_file: prefer_final_fields

import '../models/place.dart';
import '../models/user.dart';

List<Place> lugaresDeTeste = [
  Place(
    name: 'Poliesportivo claudomiro',
    address: 'Rua dos Bobos, n 0, Bairro do Limoeiro',
    description: 'O melhor poliesportivo',
    isPublic: true,
    cathegory: ['Futebol', 'Volei', 'Basquete'],
    thumbnail: null,
    capacity: 300,
  ),
  Place(
    name: 'Quadra de futebas do marcola',
    address: 'Rua Juquinha, nº143, Centro',
    description: 'Bão que só',
    isPublic: false,
    cathegory: ['Futebol'],
    thumbnail: null,
    capacity: 100,
  ),
];

// Classe de mock da base de dados para alguns testes iniciais
