import 'package:dependency_injection_flutter/di/di.dart';
import 'package:dependency_injection_flutter/repository/user_repository.dart';
import 'package:flutter/material.dart';

class DisplayUser extends StatefulWidget {
  const DisplayUser({super.key});

  @override
  State<DisplayUser> createState() => _DisplayUserState();
}

class _DisplayUserState extends State<DisplayUser> {
  var users = getIt<UserRepository>().getUsers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display User'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(users[index].name),
              subtitle: Text(
                  "${users[index].date.toString()} - ${users[index].time.toString()}"),
            ),
          );
        },
      ),
    );
  }
}
