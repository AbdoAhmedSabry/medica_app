import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/features/auth/domain/entities/user_entity.dart';
import 'package:medica/features/auth/domain/repositories/auth_repository.dart';
import 'package:medica/features/auth/presentation/manger/authstate.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());
  final AuthRepository authRepository;
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading());
    var result = await authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(AuthFailure(errorMessage: failure.message));
      },
      (user) {
        emit(AuthSuccess(user: user));
      },
    );
  }

  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    emit(RegisterLoading());
    var result = await authRepository.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
    result.fold(
      (failure) {
        emit(AuthFailure(errorMessage: failure.message));
      },
      (user) {
        emit(AuthSuccess(user: user));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(GoogleLoading());
    var result = await authRepository.signInWithGoogle();
    result.fold(
      (failure) {
        emit(AuthFailure(errorMessage: failure.message));
      },
      (user) {
        emit(AuthSuccess(user: user));
      },
    );
  }

  Future<void> signInWithFacebook() async {
    emit(FacebookLoading());
    var result = await authRepository.signInWithFacebook();
    result.fold(
      (failure) {
        emit(AuthFailure(errorMessage: failure.message));
      },
      (user) {
        emit(AuthSuccess(user: user));
      },
    );
  }

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoading());
    var result = await authRepository.forgotPassword(email);
    result.fold(
      (failure) {
        emit(AuthFailure(errorMessage: failure.message));
      },
      (_) {
        emit(
          AuthSuccess(
            user: UserEntity(uid: '', email: '', name: '', phone: ''),
          ),
        );
      },
    );
  }

  Future<void> logOut() async {
    emit(SignOutLoading());
    var result = await authRepository.logOut();
    result.fold(
      (failure) {
        emit(AuthFailure(errorMessage: failure.message));
      },
      (_) {
        emit(
          AuthSuccess(
            user: UserEntity(uid: '', email: '', name: '', phone: ''),
          ),
        );
      },
    );
  }
}
