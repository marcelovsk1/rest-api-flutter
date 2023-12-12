import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call')
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          if (users.isNotEmpty) {
          final user = users[index];
          final name = user['name'];
          final email = user['email'];
          return ListTile(
           leading: CircleAvatar(
            child: Text('${index + 1}'),
           ),
           title: Text(name.toString()),
           subtitle: Text(email),
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
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print('fetchEvents completed');
  }
}
