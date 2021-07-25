import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'login_bloc.dart';
import 'home_page.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      dependencies: [],
      blocs: [Bloc((inject) => LoginBloc())],
      child: MaterialApp(
        home: LoginManagement(),
      ),
    );
  }
}

class LoginManagement extends StatelessWidget {
  const LoginManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.getBloc<LoginBloc>();
    return StreamBuilder(
        stream: loginBloc.currentPageStream,
        builder: (context, snap) {
          return IndexedStack(
            index: loginBloc.currentPage,
            children: [MyLoginPage(), MyHomePage()],
          );
        });
  }
}
