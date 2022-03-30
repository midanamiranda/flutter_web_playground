import 'package:complete_web_course/helpers/responsiveness.dart';
import 'package:complete_web_course/widgets/large_screen.dart';
import 'package:complete_web_course/widgets/side_menu.dart';
import 'package:complete_web_course/widgets/small_screen.dart';
import 'package:complete_web_course/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen()
      ),
    );
  }
}
