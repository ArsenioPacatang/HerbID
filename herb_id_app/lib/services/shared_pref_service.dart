import '../model/user.dart';

abstract interface class SharedPrefService {
  Future<void> saveUser(User user);
  Future<User?> getCurrentUser();
}
