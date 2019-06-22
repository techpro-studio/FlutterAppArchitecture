
import 'dart:async';

import 'package:app_architecture/core/base_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/src/injector.dart';

import '../../localization.dart';


abstract class OneWidgetFactory implements WidgetFactory { }

class DefaultOneWidgetFactory extends BaseFactory implements OneWidgetFactory {
  DefaultOneWidgetFactory(Injector injector) : super(injector);

  @override
  Widget make() {
    // TODO: implement make
    return OneWidget();
  }
}

class OneWidget extends StatefulWidget {
  @override
  _OneWidgetState createState() => _OneWidgetState();
}

class _OneWidgetState extends State<OneWidget> {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(AppLocalizations.of(context).one));
  }
}
