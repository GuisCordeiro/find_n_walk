class Review {
  // id da avaliação
  int id;

  // id do avaliador
  int user_id;

  // id do local
  int place_id;

  // nota da avaliação
  double rate;

  // descrição da avaliação
  String text;

  Review(this.id, this.user_id, this.place_id, this.rate, this.text);
}
