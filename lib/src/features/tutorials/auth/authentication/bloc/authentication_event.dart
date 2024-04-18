part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class _AuthenticationStatusChanged extends AuthenticationEvent {
  const _AuthenticationStatusChanged(this.status);

  // final String status;
  final AuthenticationStatus status;

  @override
  String toString() => '_AuthenticationStatusChanged { status: $status }';
}

final class AuthenticationLogoutRequested extends AuthenticationEvent {}

// sealed class AuthenticationEvent extends Equatable {
//   const AuthenticationEvent();

//   @override
//   List<Object> get props => [];
// }