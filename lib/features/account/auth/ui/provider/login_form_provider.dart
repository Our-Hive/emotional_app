import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormProvider =
    StateNotifierProvider<LoginFormNotifier, LoginFormState>(
  (ref) => LoginFormNotifier(),
);

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier() : super(LoginFormState());

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  bool onSubmit() {
    state = state.copyWith(isSubmitting: true);
    if (validateCredentials()) {
      state = state.copyWith(
        isSuccess: true,
        isSubmitting: false,
      );
      return true;
    } else {
      state = state.copyWith(
        isFailure: true,
        isSubmitting: false,
      );
      return false;
    }
  }

  bool validateCredentials() {
    return state.email.isNotEmpty && state.password.isNotEmpty;
  }
}

class LoginFormState {
  final String email;
  final String password;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  LoginFormState({
    this.email = '',
    this.password = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  LoginFormState copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) =>
      LoginFormState(
        email: email ?? this.email,
        password: password ?? this.password,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
      );
}
