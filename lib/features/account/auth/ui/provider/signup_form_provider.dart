import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpFormProvider =
    StateNotifierProvider<SignUpFormNotifier, SignUpFormState>(
  (ref) => SignUpFormNotifier(),
);

class SignUpFormNotifier extends StateNotifier<SignUpFormState> {
  SignUpFormNotifier() : super(SignUpFormState());

  void onNickNameChanged(String nickName) {
    state = state.copyWith(nickName: nickName);
  }

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  void onFirstNameChanged(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void onLastNameChanged(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void onPhoneNumberChanged(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void onBirthDateChanged(DateTime birthDate) {
    state = state.copyWith(birthDate: birthDate);
  }

  void onStepChanged(SignUpStep step) {
    state = state.copyWith(currentStep: step);
  }

  bool validateAccountStep() {
    return state.nickName.isNotEmpty &&
        state.email.isNotEmpty &&
        state.password.isNotEmpty &&
        state.confirmPassword.isNotEmpty &&
        state.password == state.confirmPassword;
  }

  void onSummitAccountStep() {
    state = state.copyWith(
      currentStep: SignUpStep.accountStep,
      state: SignUpState.validating,
    );
    if (validateAccountStep()) {
      state = state.copyWith(
        currentStep: SignUpStep.contactStep,
        state: SignUpState.success,
      );
    } else {
      state = state.copyWith(state: SignUpState.failure);
    }
  }

  bool validateContactStep() {
    return state.firstName.isNotEmpty &&
        state.lastName.isNotEmpty &&
        state.phoneNumber.isNotEmpty &&
        state.birthDate != null;
  }

  void onSummitContactStep() {
    state = state.copyWith(
      currentStep: SignUpStep.contactStep,
      state: SignUpState.validating,
    );
    if (validateContactStep()) {
      state = state.copyWith(
        currentStep: SignUpStep.summitStep,
        state: SignUpState.success,
      );
    } else {
      state = state.copyWith(state: SignUpState.failure);
    }
  }
}

enum SignUpStep {
  none,
  accountStep,
  contactStep,
  summitStep,
}

enum SignUpState {
  empty,
  validating,
  failure,
  success,
}

class SignUpFormState {
  final String nickName;
  final String email;
  final String password;
  final String confirmPassword;
  final SignUpStep currentStep;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final DateTime? birthDate;
  final SignUpState state;

  SignUpFormState({
    this.nickName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.currentStep = SignUpStep.none,
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.birthDate,
    this.state = SignUpState.empty,
  });
  SignUpFormState copyWith({
    String? nickName,
    String? email,
    String? password,
    String? confirmPassword,
    SignUpStep? currentStep,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    DateTime? birthDate,
    SignUpState? state,
  }) =>
      SignUpFormState(
        nickName: nickName ?? this.nickName,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        currentStep: currentStep ?? this.currentStep,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        birthDate: birthDate ?? this.birthDate,
        state: state ?? this.state,
      );
}
