import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'login_bloc.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  LoginBloc? _loginBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loginBloc = BlocProvider.getBloc<LoginBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('登入頁')),
        body: Center(
          child: TextButton(
            onPressed: () {
              _loginBloc!.currentPage = 1;
            },
            child: Text('登入'),
          ),
        ));
  }
}
