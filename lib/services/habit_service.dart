import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/habit.dart';

class HabitService {
  // Fonction asynchrone pour lire les données
  Future<List<Habit>> loadHabits() async {
    // Lire le fichier JSON dans une string
    final String response = await rootBundle.loadString('assets/data/habits.json');

    // Décoder le JSON en liste dynamique
    final List<dynamic> data = jsonDecode(response);

    // Transformer chaque élément en Habit
    return data.map((item) => Habit.fromJson(item)).toList();
  }
}
