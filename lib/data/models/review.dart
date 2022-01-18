class Review {
  // id da avaliação
  int id;

  // id do avaliador
  int userId;

  // id do local
  int placeId;

  // nota da avaliação
  double rate;

  // descrição da avaliação
  String text;

  Review(this.id, this.userId, this.placeId, this.rate, this.text);
}
