import '../../../../core/either/either.dart';
import '../../../../core/exception/exception.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../model/auth_model.dart';


class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthRemoteDataSource _dataSource;

  const AuthenticationRepositoryImpl({required AuthRemoteDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> getUser() async {
    try {
      final user = await _dataSource.getUser();
      return Right(AuthenticatedUserModel.fromFirebaseUser(user));
    } on ServerException {
      return Left(
          const ServerFailure(
              message: "Page not found",
              code: 404
          ));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> login(
      String email, String password) async {
    try {
      final user = await _dataSource.login(email, password);
      return Right(AuthenticatedUserModel
          .fromFirebaseUser(user));
    } on ServerException catch (error) {
      print(error);
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final response = await _dataSource.logout();
      return Right(response);
    } on ServerException catch (error) {
      return Left(
          ServerFailure(
              message: error.message,
              code: error.code
          ));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> signUp(
      String email, String password) async {
    try {
      final response = await _dataSource.signUp(email, password);
      return Right(AuthenticatedUserModel.fromFirebaseUser(response));
    } on ServerException {
      return Left(
        const ServerFailure(
            message: "Something went wrong with signUp", code: 505),
      );
    }
  }
}
