import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'login_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LoginBloc? _loginBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loginBloc = BlocProvider.getBloc<LoginBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主頁'),
      ),
      body: Center(
        child: TextButton(
          child: Text('登出'),
          onPressed: () {
            _loginBloc!.currentPage = 0;
          },
        ),
      ),
    );
  }
}
