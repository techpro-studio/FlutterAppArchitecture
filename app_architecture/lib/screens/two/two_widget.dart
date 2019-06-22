import 'package:app_architecture/core/base_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_simple_dependency_injection/src/injector.dart';

import '../../localization.dart';

abstract class TwoWidgetFactory implements WidgetFactory {}

class DefaultTwoWidgetFactory extends BaseFactory implements TwoWidgetFactory {
  DefaultTwoWidgetFactory(Injector injector) : super(injector);

  @override
  Widget make() {
    return TwoWidget();
  }

}

class TwoWidget extends StatefulWidget {
  @override
  _TwoWidgetState createState() => _TwoWidgetState();
}

class _TwoWidgetState extends State<TwoWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(AppLocalizations.of(context).two));
  }
}
