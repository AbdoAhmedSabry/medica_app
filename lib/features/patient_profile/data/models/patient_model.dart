import 'package:medica/features/patient_profile/domain/entities/patient_entitie.dart';

class PatientModel extends PatientEntity {
  PatientModel({
    required super.uid,
    required super.weight,
    required super.height,
    required super.bloodType,
    required super.hasBloodPressure,
    required super.hasDiabetes,
    required super.chronicDiseases,
    required super.gender,
    required super.age,
  });
  factory PatientModel.fromPatientEntity(PatientEntity patientEntity) {
    return PatientModel(
      uid: patientEntity.uid,
      weight: patientEntity.weight,
      height: patientEntity.height,
      bloodType: patientEntity.bloodType,
      hasBloodPressure: patientEntity.hasBloodPressure,
      hasDiabetes: patientEntity.hasDiabetes,
      chronicDiseases: patientEntity.chronicDiseases,
      gender: patientEntity.gender,
      age: patientEntity.age,
    );
  }
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      uid: json['uid'],
      weight: json['weight'],
      height: json['height'],
      bloodType: json['bloodType'],
      hasBloodPressure: json['hasBloodPressure'],
      hasDiabetes: json['hasDiabetes'],
      chronicDiseases: json['chronicDiseases'],
      gender: json['gender'],
      age: json['age'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'weight': weight,
      'height': height,
      'bloodType': bloodType,
      'hasBloodPressure': hasBloodPressure,
      'hasDiabetes': hasDiabetes,
      'chronicDiseases': chronicDiseases,
      'gender': gender,
      'age': age,
    };
  }

  PatientEntity toPatientEntity() {
    return PatientEntity(
      uid: uid,
      weight: weight,
      height: height,
      bloodType: bloodType,
      hasBloodPressure: hasBloodPressure,
      hasDiabetes: hasDiabetes,
      chronicDiseases: chronicDiseases,
      gender: gender,
      age: age,
    );
  }
}
