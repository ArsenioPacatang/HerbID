import 'package:dartz/dartz.dart';

import '../exception/app_exception.dart';
import '../model/user.dart';

abstract interface class AuthenticationService {
  bool get isLoggedIn;

  Future<Either<AppException, None>> signup(
      String name, String email, String password);

  Future<Either<AppException, User>> signIn(String email, String password);

  Future<Either<AppException, User>> getCurrentUser();
}
