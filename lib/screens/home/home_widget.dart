import 'package:app_architecture/core/base_factory.dart';
import 'package:app_architecture/screens/one/one_widget.dart';
import 'package:app_architecture/screens/two/two_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/src/injector.dart';

import '../../localization.dart';
import 'home_bloc.dart';

abstract class HomeWidgetFactory implements WidgetFactory {}

class DefaultHomeWidgetFactory extends BaseFactory
    implements HomeWidgetFactory {
  DefaultHomeWidgetFactory(Injector injector) : super(injector);

  @override
  Widget make() {
    return HomeWidget(
        bloc: DefaultHomeBloc(),
        oneWidgetFactory: injector.get(),
        twoWidgetFactory: injector.get());
  }
}

class _TabbedWidgetConfiguration {
  final WidgetFactory factory;
  final String title;
  final bool needFab;
  final Icon icon;

  _TabbedWidgetConfiguration(
      {this.factory, this.title, this.needFab, this.icon});
}

class _HomeState extends State<HomeWidget> {

  @override
  Widget build(BuildContext context) {
    final eventsTabConfiguration = _TabbedWidgetConfiguration(
        factory: widget.oneWidgetFactory,
        title: AppLocalizations.of(context).one,
        needFab: true,
        icon: Icon(Icons.looks_one));

    final meTabConfiguration = _TabbedWidgetConfiguration(
        factory: widget.twoWidgetFactory,
        title: AppLocalizations.of(context).two,
        needFab: false,
        icon: Icon(Icons.looks_two));

    final configurations = [eventsTabConfiguration, meTabConfiguration];

    return StreamBuilder<int>(
        initialData: 0,
        stream: widget.bloc.currentTab,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final config = configurations[snapshot.data];
          return Scaffold(
              appBar: AppBar(
                  title: Text(config.title,
                      style: TextStyle(color: Colors.white))),
              bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Colors.deepOrange,
                  items: configurations.map((config) => BottomNavigationBarItem(
                      icon: config.icon, title: Text(config.title))).toList(),
                  currentIndex: snapshot.data,
                  onTap: (index) {
                    widget.bloc.setCurrentTab(index);
                  }),
              body: config.factory.make());
        });
  }

  @override
  void dispose(){
    super.dispose();
    widget.bloc.close();
  }

}

class HomeWidget extends StatefulWidget {
  final HomeBloc bloc;
  final OneWidgetFactory oneWidgetFactory;
  final TwoWidgetFactory twoWidgetFactory;

  const HomeWidget(
      {Key key,
      this.bloc,
      this.oneWidgetFactory, this.twoWidgetFactory})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}
