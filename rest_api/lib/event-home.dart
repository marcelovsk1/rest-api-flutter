import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const EventScreen(),
    );
  }
}

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<dynamic> events = [];

  Future<void> fetchEvents() async {
    print('fetchEvents called');

    try {
      // Carregar o conteúdo do arquivo JSON
      String jsonString = await rootBundle.loadString('assets/facebook.json');

      // Decodificar o JSON
      final json = jsonDecode(jsonString);

      setState(() {
        events = json['results'];
      });

      print('fetchEvents completed');
    } catch (error) {
      print('Error loading or decoding JSON: $error');
      // Tratar erros, se necessário
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: FutureBuilder(
        future: fetchEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                final title = event['title'];
                final location = event['location'];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(title.toString()),
                  subtitle: Text(location),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchEvents,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
