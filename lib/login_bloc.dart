import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';

class LoginBloc extends BlocBase {
  int _currentPage = 0;
  StreamController<int> _currentStreamController = StreamController<int>();
  //因為是內部的變數，所以需要get and set
  int get currentPage => _currentPage;
  Stream<int> get currentPageStream => _currentStreamController.stream;
  set currentPage(int value) {
    _currentPage = value;
    _currentStreamController.sink.add(value);
  }

  @override
  void dispose() {
    _currentStreamController.close();
    super.dispose();
  }
}
