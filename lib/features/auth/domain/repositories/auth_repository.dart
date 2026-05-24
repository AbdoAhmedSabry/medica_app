import 'package:dartz/dartz.dart';
import 'package:medica/config/erorr/failure.dart';
import 'package:medica/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
  });
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
}
