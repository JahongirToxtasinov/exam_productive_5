import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/status/auth_status.dart';
import '../../../../core/usecase/usecase.dart';

import '../../data/data_source/remote_data_source.dart';
import '../../data/repository/repository.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/usecase/usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticatedBloc extends Bloc<AuthenticatedEvent, AuthenticatedState> {
  AuthenticatedBloc()
      : super(
    AuthenticatedState(
      authenticatedUser: const AuthenticatedUserEntity(email: ''),
      authenticatedStatus: AuthenticatedStatus.pure,
    ),
  ) {
    on<AuthenticatedUser>(
          (event, emit) async {
        final useCase = AuthenticateUseCase(
            AuthenticationRepositoryImpl(dataSource: AuthRemoteDataSource()));
        final either = await useCase.call(GetStatusParams());
        either.either(
              (failure) {
            emit(
              state.copyWith(
                authenticatedStatus: AuthenticatedStatus.unAuthenticated,
              ),
            );
          },
              (user) {
            emit(
              state.copyWith(
                authenticatedUser: user,
                authenticatedStatus: AuthenticatedStatus.authenticated,
              ),
            );
          },
        );
      },
    );
    on<CreateUserAuth>(
          (event, emit) async {
        final useCase = AuthenticateUseCase(
            AuthenticationRepositoryImpl(dataSource: AuthRemoteDataSource()));
        final either = await useCase.call(
          SignUp(email: event.emailText, password: event.passwordText),
        );
        either.either((failure) {
          emit(
            state.copyWith(
                authenticatedStatus: AuthenticatedStatus.unAuthenticated),
          );
          event.onFailure((failure as ServerFailure).message);
        }, (user) {
          emit(
            state.copyWith(
              authenticatedStatus: AuthenticatedStatus.authenticated,
              authenticatedUser: user,
            ),
          );
          event.onSuccess();
        });
      },
    );
    on<LogoutUser>(
          (event, emit) async {
        final useCase = LogoutUseCase(
            repository: AuthenticationRepositoryImpl(
                dataSource: AuthRemoteDataSource()));
        final either = await useCase.call(NoParams());
        either.either(
              (failure) {},
              (user) {
            emit(
              state.copyWith(
                  authenticatedStatus: AuthenticatedStatus.unAuthenticated),
            );

          },
        );
      },
    );
    on<LoginUserAuth>(
          (event, emit) async {
        final useCase = AuthenticateUseCase(
          AuthenticationRepositoryImpl(
            dataSource: AuthRemoteDataSource(),
          ),
        );
        final either = await useCase.call(
          LoginParams(
            email: event.emailText,
            password: event.passwordText,
          ),
        );
        either.either(
              (failure) {
            emit(
              state.copyWith(
                authenticatedStatus: AuthenticatedStatus.unAuthenticated,
              ),
            );
            event.onFailure((failure as ServerFailure).message);
          },
              (user) {
            emit(
              state.copyWith(
                authenticatedUser: user,
                authenticatedStatus: AuthenticatedStatus.authenticated,
              ),
            );
            event.onSuccess();
          },
        );
      },
    );
  }
}
