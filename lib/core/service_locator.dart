import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_gallery/data/repo/repo.dart';
import 'package:my_gallery/data/repo/repo_impl.dart';
import '../presentation/bloc/login_bloc/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // BLoc
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(
        getIt<Repo>(),
      ));


  // repo
  getIt.registerLazySingleton<Repo>(() => RepoImpl(
        getIt(),
      ));

  // external package
  getIt.registerLazySingleton(() => Dio());
}
