import 'package:complete_web_course/constants/constants.dart';
import 'package:complete_web_course/constants/controllers.dart';
import 'package:complete_web_course/constants/style.dart';
import 'package:complete_web_course/controllers/auth_controller.dart';
import 'package:complete_web_course/controllers/menu_controller.dart';
import 'package:complete_web_course/controllers/navigation_controller.dart';
import 'package:complete_web_course/layout.dart';
import 'package:complete_web_course/pages/404/error_page.dart';
import 'package:complete_web_course/pages/authentication/auhtentication.dart';
import 'package:complete_web_course/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization;

  Get.put(MenuController());
  Get.put(NavigationController());
  Get.put(AuthController());
  authController.setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: authenticationPageRoute,
      unknownRoute: GetPage(name: "/not-found", page: () => PageNotFound(), transition: Transition.fadeIn),
      getPages: [
        GetPage(name: rootRoute, page: () => SiteLayout()),
        GetPage(name: authenticationPageRoute, page: () => const AuthenticationPage()),
      ],
      debugShowCheckedModeBanner: false,
      title: "Dashboard",
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme
        ).apply(
          bodyColor: Colors.black
        ),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
        primaryColor: Colors.blue
      ),
    );
  }
}
