import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/book_model.dart';
// import '../models/character_model.dart';
import '../models/spell_model.dart';

// Service untuk melakukan HTTP Request ke API Potter
class ApiService {
  static const String _booksUrl =
      'https://potterapi-fedeperin.vercel.app/en/books';

  static const String _spellsUrl =
      'https://potterapi-fedeperin.vercel.app/en/spells';

// static const String _charactersUrl =
  //     'https://potterapi-fedeperin.vercel.app/en/characters';

  static Future<List<Book>> getBooks() async {
    final response = await http.get(Uri.parse(_booksUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((json) => Book.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Gagal memuat data buku dari API (${response.statusCode})');
  }

  // // Fungsi untuk mengambil daftar karakter Harry Potter
  //  static Future<List<Character>> getCharacters() async {
  // //   final response = await http.get(Uri.parse(_charactersUrl));

  //   // Status code 200 berarti request berhasil
  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     // Map setiap item json menjadi objek Character
  //     return data.map((json) => Character.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Gagal memuat data karakter dari API');
  //   }
  // }

  // Fungsi untuk mengambil daftar mantra (spells) Harry Potter
  static Future<List<Spell>> getSpells() async {
    final response = await http.get(Uri.parse(_spellsUrl));

    // Status code 200 berarti request berhasil
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      // Map setiap item json menjadi objek Spell
      return data.map((json) => Spell.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data mantra dari API');
    }
  }
}
