import '../../model/user.dart';

class RemoteDataSource {
  List<User> users = [
    User(
      id: 1,
      name: 'Remote Hari',
      age: 30,
      date: '2021-09-01',
      time: '12:00:00',
    ),
    User(
      id: 2,
      name: 'Remote Sita',
      age: 25,
      date: '2021-09-01',
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
