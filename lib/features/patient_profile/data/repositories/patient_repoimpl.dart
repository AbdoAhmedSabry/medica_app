import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medica/config/backendpoint.dart';
import 'package:medica/config/cachehelper.dart';
import 'package:medica/config/erorr/failure.dart';
import 'package:medica/features/patient_profile/data/models/patient_model.dart';
import 'package:medica/features/patient_profile/domain/entities/patient_entitie.dart';
import 'package:medica/features/patient_profile/domain/repostiries/patiend_repo.dart';
import '../../../../config/services/databaseservice.dart';

class PatientRepoImpl implements PatientRepo {
  final Databasabaseservice databaseservice;
  PatientRepoImpl({required this.databaseservice});
  @override
  Future<Either<Failure, void>> updatePatient({
    required PatientEntity patientEntity,
  }) async {
    try {
      final data = PatientModel.fromPatientEntity(patientEntity).toJson();
      await databaseservice.updateData(
        collectionPath: BackEndpoint.patientCollection,
        docId: patientEntity.uid,
        data: data,
      );
      String userJson = jsonEncode(data);
      await CacheHelper.saveData(
        key: CacheEndpoint.patientProfile,
        value: userJson,
      );
      return Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseAuthException(e));
    } on FirebaseException catch (e) {
      return Left(
        ServerFailure(message: e.message ?? 'حدث خطأ في قاعدة البيانات'),
      );
    } catch (e) {
      return Left(
        ServerFailure(message: 'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً'),
      );
    }
  }

  @override
  Future<Either<Failure, PatientEntity>> getPatient({
    required String uid,
  }) async {
    try {
      final patient = await databaseservice.getData(
        collectionPath: BackEndpoint.patientCollection,
        docId: uid,
      );
      if (patient == null) {
        return Left(ServerFailure(message: 'المريض غير موجود'));
      }
      return Right(PatientModel.fromJson(patient));
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseAuthException(e));
    } on FirebaseException catch (e) {
      return Left(
        ServerFailure(message: e.message ?? 'حدث خطأ في قاعدة البيانات'),
      );
    } catch (e) {
      return Left(
        ServerFailure(message: 'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً'),
      );
    }
  }
}
