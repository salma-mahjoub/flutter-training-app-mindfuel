import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  void toggleFavorite(Map<String, String> item) {
    final exists = _favorites.any((element) => element['title'] == item['title']);
    if (exists) {
      _favorites.removeWhere((element) => element['title'] == item['title']);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(Map<String, String> item) {
    return _favorites.any((element) => element['title'] == item['title']);
  }
}
