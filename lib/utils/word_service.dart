// lib/services/word_service.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WordService {
  static const String _baseUrl = 'random-word-api.p.rapidapi.com';
  static const String _apiKey =
      '035a90b502msh6551da21d75098fp10121ejsnae6e80cf4ca3';

  static Future<List<String>> fetchWords(int length) async {
    try {
      final url = Uri.https(_baseUrl, '/L/$length');

      final response = await http.get(
        url,
        headers: {
          'X-RapidAPI-Key': _apiKey,
          'X-RapidAPI-Host': _baseUrl,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        String word = data['word'].toString().toUpperCase();

        // API'den gelen kelimeyi listeye ekle
        List<String> words = [word];
        debugPrint('Fetched Word: $word');
        return words;
      } else {
        debugPrint('API Error: ${response.statusCode} - ${response.body}');
        return getMockWords(length);
      }
    } catch (e) {
      debugPrint('Service Error: $e');
      return getMockWords(length);
    }
  }

  static List<String> getMockWords(int length) {
    switch (length) {
      case 4:
        return ['WORD', 'PLAY', 'GAME', 'TEST', 'MOCK'];
      case 5:
        return ['WORLD', 'PLAYS', 'GAMES', 'TESTS', 'MOCKS'];
      case 6:
        return ['WORLDS', 'PLAYER', 'GAMING', 'TESTED', 'MOCKED'];
      default:
        return ['TEST'];
    }
  }
}
