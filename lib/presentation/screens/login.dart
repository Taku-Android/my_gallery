import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/core/service_locator.dart';
import 'package:my_gallery/presentation/bloc/login_bloc/login_cubit.dart';
import '../widgets/login/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: const Scaffold(
        body: LoginBody(),
      ),
    );
  }
}
