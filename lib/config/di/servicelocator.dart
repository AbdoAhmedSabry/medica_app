import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:medica/features/auth/domain/repositories/auth_repository.dart';

import '../../features/auth/data/data_sources/auth_local_data_source.dart';
import '../../features/auth/data/data_sources/remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/presentation/manger/auth_cubit.dart';
import '../services/databaseservice.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // External
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  // Data Sources
  getIt.registerLazySingleton(() => FirebaseAuthServic(getIt()));
  getIt.registerLazySingleton(
    () => Databasabaseservice(firestoreService: getIt()),
  );
  // getIt.registerLazySingleton(() => AuthLocalDataSource());

  // Repository
  // هنا بنحدد لـ GetIt إنه لما حد يطلب AuthRepository يديله النسخة دي من AuthRepositoryImpl
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      firebaseAuthServic: getIt<FirebaseAuthServic>(),
      databaseservice: getIt<Databasabaseservice>(),
    ),
  );

  // State Management
  // نحدد النوع هنا أيضاً لضمان الحقن السليم
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));
}
