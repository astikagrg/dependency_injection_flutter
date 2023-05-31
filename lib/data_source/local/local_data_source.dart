import '../../model/user.dart';

class LocalDataSource {
  List<User> users = [
    User(
      id: 1,
      name: 'Local Hari',
      age: 30,
      date: '2021-09-01',
      time: '12:00:00',
    ),
    User(
      id: 2,
      name: 'Local Sita',
      age: 25,
      date: '2021-09-02',
      time: '12:00:00',
    ),
  ];

  bool addUser(User user) {
    users.add(user);
    return true;
  }

  List<User> getUsers() {
    return users;
  }
}
