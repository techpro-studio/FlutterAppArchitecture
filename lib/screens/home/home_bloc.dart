import 'dart:async';
import 'package:app_architecture/core/closeable.dart';

abstract class HomeBloc extends Closeable {
  // ignore: close_sinks
  Stream<int> get currentTab;

  void setCurrentTab(int value);

}

class DefaultHomeBloc implements HomeBloc {
  final _currentTab = StreamController<int>();


  @override
  Stream<int> get currentTab => _currentTab.stream;

  @override
  void setCurrentTab(int value) {
    _currentTab.add(value);
  }

  @override
  void close() {
    _currentTab.close();
  }
}
