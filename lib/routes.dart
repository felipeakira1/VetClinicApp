

import 'package:flutter/widgets.dart';
import 'package:tempvet/view/pages/add_animals_page.dart';
import 'package:tempvet/view/pages/animals_page.dart';

Map<String, WidgetBuilder> routes = {
  '/animals': (BuildContext context) => const AnimalsPage(),
  '/add-animal': (BuildContext context) => const AddAnimalsPage(),
};