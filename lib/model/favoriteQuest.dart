import 'dart:convert';

class FavoriteQuestion {
  final String questionText;
  final List<String> options;
  final List<String> correctOptions;
  final String? photo;

  FavoriteQuestion({
    required this.questionText,
    required this.options,
    required this.correctOptions,
    this.photo,
  });

  // From JSON
  factory FavoriteQuestion.fromJson(Map<String, dynamic> json) {
    return FavoriteQuestion(
      questionText: json['questionText'],
      options: List<String>.from(json['options']),
      correctOptions: List<String>.from(json['correctOptions']),
      photo: json['photo'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'questionText': questionText,
      'options': options,
      'correctOptions': correctOptions,
      'photo': photo,
    };
  }
}
