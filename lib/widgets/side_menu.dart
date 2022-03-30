import 'package:complete_web_course/constants/controllers.dart';
import 'package:complete_web_course/constants/style.dart';
import 'package:complete_web_course/helpers/responsiveness.dart';
import 'package:complete_web_course/routing/routes.dart';
import 'package:complete_web_course/widgets/custom_text.dart';
import 'package:complete_web_course/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if(ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    Container(
                      padding: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36)
                      ),
                      child: Image.asset(
                          "assets/icons/logo.png",
                        width: 36,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Dashboard",
                        size: 20,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(width: _width / 48),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(color: lightGrey.withOpacity(.1), ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((item) => SideMenuItem(
                itemName: item.name,
                onTap: () {
                  if(item.route == authenticationPageRoute){
                    authController.signOut();
                    Get.offAllNamed(authenticationPageRoute);
                    menuController.changeActiveItemTo(overviewPageDisplayName);
                  }
                  if (!menuController.isActive(item.name)) {
                    menuController.changeActiveItemTo(item.name);
                    if(ResponsiveWidget.isSmallScreen(context)) {
                      Get.back();
                    }
                    navigationController.navigateTo(item.route);
                  }
                }))
                .toList(),
          )
        ],
      ),
    );
  }
}