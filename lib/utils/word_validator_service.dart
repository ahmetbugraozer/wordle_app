// lib/services/word_validator_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';

class WordValidatorService {
  static Map<String, dynamic>? _dictionary;

  static Future<void> initialize() async {
    if (_dictionary == null) {
      final String jsonString =
          await rootBundle.loadString('assets/word_validator.json');
      _dictionary = json.decode(jsonString);
    }
  }

  static bool isValidWord(String word) {
    if (_dictionary == null) return false;
    return _dictionary!.containsKey(word.toLowerCase());
  }
}
