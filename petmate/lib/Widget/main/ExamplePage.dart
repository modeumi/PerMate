import 'package:flutter/material.dart';

class BaseflowPluginExample extends StatelessWidget {
  final String pluginName;
  final String githubURL;
  final String pubDevURL;
  final List<Widget> appBarActions;
  final List<ExamplePage> pages;

  BaseflowPluginExample({
    required this.pluginName,
    required this.githubURL,
    required this.pubDevURL,
    required this.appBarActions,
    required this.pages,
  });
  
  get themeMaterialColor => null;

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: pluginName,
      theme: ThemeData(
        primarySwatch: themeMaterialColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(pluginName),
          actions: appBarActions,
        ),
        body: PageView(
          children: pages,
        ),
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  final IconData icon;
  final WidgetBuilder builder;

  ExamplePage(this.icon, this.builder);

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
