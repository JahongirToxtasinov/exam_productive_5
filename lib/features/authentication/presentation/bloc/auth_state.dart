part of 'auth_bloc.dart';

class AuthenticatedState {
  final AuthenticatedStatus authenticatedStatus;
  final AuthenticatedUserEntity authenticatedUser;

  AuthenticatedState({
    required this.authenticatedStatus,
    required this.authenticatedUser,
  });

  AuthenticatedState copyWith({
    AuthenticatedStatus? authenticatedStatus,
    AuthenticatedUserEntity? authenticatedUser,
  }) {
    return AuthenticatedState(
      authenticatedStatus: authenticatedStatus ?? this.authenticatedStatus,
      authenticatedUser: authenticatedUser ?? this.authenticatedUser,
    );
  }

  @override
  String toString() =>
      '''
   AuthenticatedState
   authStatus: $authenticatedStatus, 
   authUser: $authenticatedUser''';
}
