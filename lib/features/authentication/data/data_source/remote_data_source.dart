import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/exception/exception.dart';

abstract class AuthRemoteDataSource {
  Future<User> getUser();
  Future<User> signUp(String email, String password);
  Future<User> login(String email, String password);
  Future<void> logout();

  factory AuthRemoteDataSource() => _AuthRemoteDataSource();
}

class _AuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<User> getUser() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        throw ServerException(errorMessage: "User is null", errorCode: '140');
      }
      return FirebaseAuth.instance.currentUser!;
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword
        (email: email,
          password: password);
      return await getUser();
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(
          errorMessage: "$error",
          errorCode: "500"
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw ServerException(
          errorMessage: "Cannot logout",
          errorCode: "500"
      );
    }
  }

  @override
  Future<User> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return FirebaseAuth.instance.currentUser!;
    } catch (e) {
      throw ServerException(
        errorMessage: "SignUp not worked !",
        errorCode: "666",
      );
    }
  }
}
