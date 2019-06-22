import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'app.dart';
import 'inject.dart';

void main() {
  final injector = Injector.getInjector();
  buildInjector(injector);
  runApp(App(homeWidgetFactory: injector.get()));
}

