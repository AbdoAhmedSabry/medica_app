class PatientEntity {
  final String uid;
  final double weight;
  final double height;
  final String bloodType;
  final bool hasBloodPressure;
  final bool hasDiabetes;
  final List<String> chronicDiseases;
  final String gender;
  final int age;

  const PatientEntity({
    required this.uid,
    required this.weight,
    required this.height,
    required this.bloodType,
    required this.hasBloodPressure,
    required this.hasDiabetes,
    required this.chronicDiseases,
    required this.gender,
    required this.age,
  });
}
