import 'package:flutter/material.dart';

import '../di/di.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

class UserAddView extends StatefulWidget {
  const UserAddView({super.key});

  @override
  State<UserAddView> createState() => _UserAddViewState();
}

class _UserAddViewState extends State<UserAddView> {
  TimeOfDay? time = TimeOfDay.now();
  DateTime? date = DateTime.now();
  final idController = TextEditingController(text: '123');
  final ageController = TextEditingController(text: '13');

  final nameController = TextEditingController(text: 'abc');

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color.fromARGB(255, 89, 23, 108),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: idController,
                    style: const TextStyle(
                        color: Colors.purple), // Set text color to purple
                    decoration: InputDecoration(
                      labelText: "ID",
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ), // Set label text color to purple
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your id ';
                      } else if (value.isNotEmpty && value.length < 0) {
                        return 'Please enter a valid id';
                      }
                      return null;
                    },
                  ),
                ),

                // age
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ageController,
                    style: const TextStyle(
                        color: Colors.purple), // Set text color to purple
                    decoration: InputDecoration(
                      labelText: "Age",
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ), // Set label text color to purple
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your age ';
                      }
                      return null;
                    },
                  ),
                ),

                // name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    style: const TextStyle(
                        color: Colors.purple), // Set text color to purple
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ), // Set label text color to purple
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name ';
                      }
                      return null;
                    },
                  ),
                ),

                // time
                Text(
                  'Time: ${time!.hour}:${time!.minute}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 89, 23, 108)),
                    alignment: Alignment.center,
                  ),
                  onPressed: () async {
                    TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: time!,
                    );
                    if (newTime != null) {
                      setState(() {
                        time = newTime;
                      });
                    }
                  },
                  child: const Text("Change Time"),
                ),

                // date
                Text(
                  'Date: ${date!.day}/${date!.month}/${date!.year}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 89, 23, 108)),
                    alignment: Alignment.center,
                  ),
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date!,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050),
                    );
                    if (newDate != null) {
                      setState(() {
                        date = newDate;
                      });
                    }
                  },
                  child: const Text('Change Date'),
                ),

                // submit button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 50)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 89, 23, 108)),
                        alignment: Alignment.center,
                      ),
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          var User1 = User(
                            id: int.parse(idController.text),
                            name: nameController.text,
                            age: int.parse(ageController.text),
                            time: '${time!.hour}:${time!.minute}',
                            date: '${date!.day}/${date!.month}/${date!.year}',
                          );
                          if (getIt<UserRepository>().addUser(User1)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added User'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Error Occured'),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('Add User'),
                    ),
                  ),
                ),

                // view user button

                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 89, 23, 108)),
                    alignment: Alignment.center,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewuser');
                  },
                  child: const Text("View User"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
