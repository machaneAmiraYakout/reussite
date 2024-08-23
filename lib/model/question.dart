class QuestionData {
  final String question;
  final List<String> options;
  final List<String> correctAnswers;
  final String? photo; // Optional field for the photo

  QuestionData({
    required this.question,
    required this.options,
    required this.correctAnswers,
    this.photo,
  });

  factory QuestionData.fromJson(Map<String, dynamic> json) {
    return QuestionData(
      question: json['question'] as String,
      options: List<String>.from(json['options']),
      correctAnswers: List<String>.from(json['correctAnswers']),
      photo: json['photo'] as String?, // Load the photo if it exists
    );
  }
}