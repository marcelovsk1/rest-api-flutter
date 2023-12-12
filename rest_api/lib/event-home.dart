import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<dynamic> events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call')
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context,index){
          if (events.isNotEmpty) {
          final event = events[index];
          final title = event['title'];
          final date = event['date'];
          final location = event['location'];
          final people_interested = event ['people interested'];
          return ListTile(
           leading: CircleAvatar(
            child: Text('${index + 1}'),
           ),
           title: Text(title.toString()),
           subtitle: Text(date),
          );
          } else {
            return ListTile(
              title: Text('No users available'),
            );
        };
        },
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
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      events = json['results'];
    });
    print('fetchEvents completed');
  }
}
