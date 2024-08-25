import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../model/favoriteQuest.dart';

class FavoriteController extends GetxController {
  var favoriteQuestions = <FavoriteQuestion>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFavorites();
  }

  void toggleFavorite(FavoriteQuestion question) {
    if (isFavorite(question)) {
      favoriteQuestions.removeWhere((q) => q.questionText == question.questionText);
      _saveFavorites();
    } else {
      favoriteQuestions.add(question);
      _saveFavorites();
    }
  }

  bool isFavorite(FavoriteQuestion question) {
    return favoriteQuestions.any((q) => q.questionText == question.questionText);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('favorites') ?? '[]';
    final List<dynamic> jsonList = json.decode(jsonString);
    favoriteQuestions.value = jsonList.map((json) => FavoriteQuestion.fromJson(json)).toList();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = favoriteQuestions.map((q) => q.toJson()).toList();
    final jsonString = json.encode(jsonList);
    prefs.setString('favorites', jsonString);
  }
}
