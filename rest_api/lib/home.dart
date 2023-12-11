import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  void fetchEvents() {
    print('fetchEvents called');
    const url = '';
    final uri = Uri.parse(url);
    http.get(uri);
  }
}
