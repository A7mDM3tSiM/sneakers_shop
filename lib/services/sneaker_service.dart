import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/sneaker.dart';

class SneakerService {
  Future<List<Sneaker>> fetchSneakers() async {
    await Future.delayed(const Duration(seconds: 2));

    // Simulate fetching data from a network
    final String response = await rootBundle.loadString('assets/sneakers.json');

    final data = json.decode(response) as List;
    return data.map((json) => Sneaker.fromJson(json)).toList();
  }
}
