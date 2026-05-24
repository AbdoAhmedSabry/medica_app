import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medica/config/erorr/failure.dart';
import 'package:medica/config/services/databaseservice.dart';
import 'package:medica/features/auth/data/data_sources/remote_data_source.dart';
import 'package:medica/features/auth/data/models/user_model.dart';
import 'package:medica/features/auth/domain/entities/user_entity.dart';
import 'package:medica/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthServic firebaseAuthServic;
  final Databasabaseservice databaseservice;

  AuthRepositoryImpl({
    required this.firebaseAuthServic,
    required this.databaseservice,
  });

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthServic.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userexist = await databaseservice.getData(
        collectionPath: 'patients',
        docId: user.uid,
      );
      if (userexist == null) {
        final userModel = UserModel.fromUserEntity(user);
        await databaseservice.setData(
          collectionPath: 'patients',
          docId: user.uid,
          data: userModel.toJson(),
        );
        return right(userModel);
      } else {
        final userModel = UserModel.fromJson(userexist);
        return right(userModel);
      }
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure.fromFirebaseAuthException(e));
    } on Exception catch (e) {
      return left(ServerFailure.fromException(e));
    } catch (e) {
      return left(ServerFailure(message: "Try again later"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final user = await firebaseAuthServic.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
      final userModel = UserModel.fromUserEntity(user);
      await databaseservice.setData(
        collectionPath: 'patients',
        docId: user.uid,
        data: userModel.toJson(),
      );
      return right(userModel);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure.fromFirebaseAuthException(e));
    } on Exception catch (e) {
      return left(ServerFailure.fromException(e));
    } catch (e) {
      return left(ServerFailure(message: "Try again later"));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      await firebaseAuthServic.forgotPassword(email: email);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure.fromFirebaseAuthException(e));
    } on Exception catch (e) {
      return left(ServerFailure.fromException(e));
    } catch (e) {
      return left(ServerFailure(message: "Try again later"));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await firebaseAuthServic.logOut();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure.fromFirebaseAuthException(e));
    } on Exception catch (e) {
      return left(ServerFailure.fromException(e));
    } catch (e) {
      return left(ServerFailure(message: "Try again later"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthServic.signInWithGoogle();
      final userexist = await databaseservice.getData(
        collectionPath: 'patients',
        docId: user.uid,
      );
      if (userexist == null) {
        final userModel = UserModel.fromUserEntity(user);
        await databaseservice.setData(
          collectionPath: 'patients',
          docId: user.uid,
          data: userModel.toJson(),
        );
        return right(userModel);
      } else {
        final userModel = UserModel.fromJson(userexist);
        return right(userModel);
      }
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure.fromFirebaseAuthException(e));
    } on Exception catch (e) {
      return left(ServerFailure.fromException(e));
    } catch (e) {
      return left(ServerFailure(message: "Try again later"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await firebaseAuthServic.signInWithFacebook();
      final userexist = await databaseservice.getData(
        collectionPath: 'patients',
        docId: user.uid,
      );
      if (userexist == null) {
        final userModel = UserModel.fromUserEntity(user);
        await databaseservice.setData(
          collectionPath: 'patients',
          docId: user.uid,
          data: userModel.toJson(),
        );
        return right(userModel);
      } else {
        final userModel = UserModel.fromJson(userexist);
        return right(userModel);
      }
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure.fromFirebaseAuthException(e));
    } on Exception catch (e) {
      return left(ServerFailure.fromException(e));
    } catch (e) {
      return left(ServerFailure(message: "Try again later"));
    }
  }
}
