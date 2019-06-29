# Flutter app architecture

Flutter app architecture we use.

WBF = Widget BLoC Factory

SOLID principles are core of this acrhitecture.

It is improved BLoC pattern proposed by Google + Factory.


We use DI pattern, with [this simple library](https://pub.dev/packages/flutter_simple_dependency_injection)

Every Module for Statefull Widget has following structure:

1. Factory - factory that create Widget. 

```Dart
  abstract class WidgetFactory {
     Widget make();
  }
```

BaseFactory contains DI Container, so we can inject in Widget Whatever we want.

```Dart
  class BaseFactory{
    final Injector injector;

    BaseFactory(this.injector);
  }
```

If our Widget has children Statefull Widgets, we inject WidgetFactories inside our parent. It brings us a lot of flexibility.

For example: 

```Dart
  class Default<Name>WidgetFactory extends BaseFactory
    implements <Name>WidgetFactory {
  Default<Name>WidgetFactory(Injector injector) : super(injector);

    @override
    Widget make() {
        return <Name>Widget(
        bloc: Default<Name>Bloc(),
        oneWidgetFactory: injector.get(),
        twoWidgetFactory: injector.get());
    }
}

```
2. Widget

Statefull Widget. 

Widget itself contains dependencies

```Dart
  class <Name>Widget extends StatefulWidget {
  final <Name>Bloc bloc;
  final OneWidgetFactory oneWidgetFactory;
  final TwoWidgetFactory twoWidgetFactory;

  const <Name>Widget(
      {Key key,
      this.bloc,
      this.oneWidgetFactory, this.twoWidgetFactory})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _<Name>State();
}
```

State contains binding for BLoC streams.

3. BLoC. 

Basically ViewModel in MVVM pattern. It has streams with ready to use data for Widget.

```Dart

abstract class <Name>Bloc extends Closeable {

  Stream<int> get currentTab;

  void setCurrentTab(int value);

}
```

We inject all logic we need for widget in BLoC in widget Factory.

All Units for BLoC should have single responsibility, and should be abstractions. 










