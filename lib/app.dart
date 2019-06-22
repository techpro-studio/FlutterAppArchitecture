import 'package:app_architecture/screens/home/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/no_ripple_factory.dart';
import 'localization.dart';



class App extends StatelessWidget {

  final HomeWidgetFactory homeWidgetFactory;

  const App({Key key, this.homeWidgetFactory}) : super(key: key);

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return MaterialApp(
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: SupportedLocales.map((it)=> Locale(it)),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
            splashFactory: NoRippleFactory(),
        ),
        home: homeWidgetFactory.make()
    );
  }
}

