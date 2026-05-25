import 'package:medica/config/erorr/failure.dart';
import 'package:medica/features/patient_profile/domain/entities/patient_entitie.dart';
import 'package:dartz/dartz.dart';

abstract class PatientRepo {
  Future<Either<Failure, void>> updatePatient({
    required PatientEntity patientEntity,
  });
  Future<Either<Failure, PatientEntity>> getPatient({required String uid});
}
