import 'package:emotional_app/features/account/auth/domain/entities/login_credentials.dart';
import 'package:emotional_app/features/account/auth/domain/entities/sign_up_credentials.dart';
import 'package:emotional_app/features/account/auth/domain/repository/auth_repo.dart';
import 'package:emotional_app/features/account/auth/infra/data_source/auth_api_data_source.dart';
import 'package:emotional_app/features/account/auth/infra/repo/auth_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    authRepo: AuthRepoImpl(
      authDataSource: AuthApiDataSourceImpl(),
    ),
  ),
);

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepo _authRepo;
  AuthNotifier({required AuthRepo authRepo})
      : _authRepo = authRepo,
        super(AuthState.initial());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: '');
    try {
      final token = await _authRepo
          .login(LoginCredentials(email: email, password: password));
      state = state.copyWith(
          isLoading: false, isAuth: true, token: token.accessToken);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> signUp(SignUpCredentials signUpCredentials) async {
    state = state.copyWith(isLoading: true, error: '');
    try {
      final token = await _authRepo.signUp(signUpCredentials);
      state = state.copyWith(
          isLoading: false, isAuth: true, token: token.accessToken);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

class AuthState {
  final bool isLoading;
  final bool isAuth;
  final String token;
  final String error;

  AuthState({
    required this.isLoading,
    required this.isAuth,
    this.token = '',
    this.error = '',
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      isAuth: false,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    bool? isAuth,
    String? token,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuth: isAuth ?? this.isAuth,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }
}
