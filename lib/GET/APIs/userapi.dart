import 'dart:convert';
import 'package:apilearn/GET/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Userapi extends StatefulWidget {
  const Userapi({super.key});

  @override
  State<Userapi> createState() => _UserapiState();
}

class _UserapiState extends State<Userapi> {
  Future<List<usermodel>> getuseronapicall() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/users"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // ✅ DummyJSON returns object with "users" list
      List users = data["users"];

      return users.map((e) => usermodel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: FutureBuilder<List<usermodel>>(
        future: getuseronapicall(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found"));
          }

          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(users[index].name.toString()),
                  subtitle: Text(users[index].email.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
