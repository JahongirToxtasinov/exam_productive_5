import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/auth_entity.dart';
import '../repository/repository.dart';


class AuthenticateUseCase implements UseCase<AuthenticatedUserEntity, Params> {
  final AuthenticationRepository _repository;

  AuthenticateUseCase(AuthenticationRepository repository)
      : _repository = repository;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> call(Params params) async {
    if (params is GetStatusParams) {
      return await _repository.getUser();
    } else if (params is LoginParams) {
      return await _repository.login(params.email, params.password);
    } else if (params is SignUp) {
      return await _repository.signUp(params.email, params.password);
    } else {
      throw UnimplementedError();
    }
  }
}

class AuthenticateUseCaseResponse {}

abstract class Params {}

class GetStatusParams extends Params {}

class LoginParams extends Params {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}

class SignUp extends Params {
  final String email;
  final String password;
  SignUp({
    required this.email,
    required this.password,
  });
}

class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthenticationRepository repository;

  LogoutUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.logout();
  }
}
