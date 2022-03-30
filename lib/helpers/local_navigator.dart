import 'package:complete_web_course/constants/controllers.dart';
import 'package:complete_web_course/routing/router.dart';
import 'package:complete_web_course/routing/routes.dart';
import 'package:flutter/widgets.dart';

Navigator localNavigator() => Navigator(
  key: navigationController.navigatorKey,
  onGenerateRoute: generateRoute,
  initialRoute: overviewPageRoute,
);