

import 'package:flutter/widgets.dart';
import 'package:tempvet/view/pages/animals_page.dart';
import 'package:tempvet/view/pages/home_page.dart';
import 'package:tempvet/view/pages/login_page.dart';

Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => LoginPage(),
  '/home': (BuildContext context) => const HomePage(),
  '/animals': (BuildContext context) => AnimalsPage(),
};