import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return ServerFailure(message: 'No account exists with this email.');
      case 'wrong-password':
        return ServerFailure(message: 'Incorrect password.');
      case 'email-already-in-use':
        return ServerFailure(message: 'This email is already in use.');
      case 'invalid-email':
        return ServerFailure(message: 'Invalid email address.');
      case 'weak-password':
        return ServerFailure(message: 'Password is too weak.');
      case 'network-request-failed':
        return ServerFailure(message: 'Check your internet connection');
      case 'too-many-requests':
        return ServerFailure(message: 'Too many requests');
      default:
        return ServerFailure(message: 'Try again later');
    }
  }

  factory ServerFailure.fromException(Exception e) {
    if (e is ServerException) {
      return ServerFailure(message: e.message);
    }
    return ServerFailure(message: "Try again later");
  }
}

class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}
