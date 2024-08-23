import 'package:get/get.dart';

class QuoteController extends GetxController {
  final quotes = [
    "The only limit to our realization of tomorrow is our doubts of today. – Franklin D. Roosevelt",
    "The future belongs to those who believe in the beauty of their dreams. – Eleanor Roosevelt",
    "Keep pushing forward.",
    "You can do it!",
    "Act as if what you do makes a difference. It does.– William James",
    "Never give up.",
    "Stay positive and strong.",
    "You must be the change you wish to see in the world. – Mahatma Gandhi",
  ].obs;

  var currentIndex = 0.obs;

  void changeQuote() {
    currentIndex.value = (currentIndex.value + 1) % quotes.length;
  }
}