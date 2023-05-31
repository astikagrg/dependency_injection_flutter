class User {
  final int id;
  final String name;
  final int age;
  final String? time;
  final String? date;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.time,
    required this.date,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, age: $age, time: $time, date: $date)';
  }
}
