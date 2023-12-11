import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchEvents,
      ),
    );
  }

  Future<void> fetchEvents() async {
    print('fetchEvents called');
    const url = 'http://127.0.0.1:5500/APIs/Facebook_Events/facebook.json';
    final uri = Uri.parse(url);
    http.get(uri);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      events = json['results'];
    });
    print('fetchEvents completed');
  }
}
