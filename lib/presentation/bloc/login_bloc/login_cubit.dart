
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/data/repo/repo.dart';

import '../../../data/model/login_data.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());


  final Repo repo;

  login(LoginData loginData) async {
    emit(LoginLoading());
    var result = await repo.login(loginData);

    result.fold(
            (failure) => emit(LoginFailure(failure.errMessage)),
            (success) => emit(
          LoginSuccess(success),
        ));
  }

}
