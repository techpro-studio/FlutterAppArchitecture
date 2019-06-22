
import 'package:flutter/widgets.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class BaseFactory{
  final Injector injector;

  BaseFactory(this.injector);
}



abstract class WidgetFactory {
   Widget make();
}