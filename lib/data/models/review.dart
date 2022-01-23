// Classe que representa uma avaliação.
// Seu id no banco de dados é gerado automaticamente.

class Review {
  // id do avaliador
  String userId;

  // nota da avaliação
  int rating;

  // texto da avaliação
  String text;

  Review({required this.userId, required this.rating, required this.text});

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'rating': rating,
      'text': text,
    };
  }

  static Review fromJson(Map<String, dynamic> json) {
    return Review(
      userId: json['user_id'],
      rating: json['rating'],
      text: json['text'],
    );
  }
}
