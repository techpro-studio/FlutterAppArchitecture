import 'package:app_architecture/screens/home/home_widget.dart';
import 'package:app_architecture/screens/one/one_widget.dart';
import 'package:app_architecture/screens/two/two_widget.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';


void buildInjector(Injector injector){
  injector.map<HomeWidgetFactory>((injector){
      return DefaultHomeWidgetFactory(injector);
  });

  injector.map<OneWidgetFactory>((injector){
      return DefaultOneWidgetFactory(injector);
  });

  injector.map<TwoWidgetFactory>((injector){
    return DefaultTwoWidgetFactory(injector);
  });


}