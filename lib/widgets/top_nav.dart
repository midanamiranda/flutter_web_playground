import 'package:complete_web_course/constants/controllers.dart';
import 'package:complete_web_course/constants/style.dart';
import 'package:complete_web_course/helpers/responsiveness.dart';
import 'package:complete_web_course/widgets/custom_text.dart';
import 'package:flutter/material.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context) ?
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30)
            ),
            child: Image.asset("assets/icons/logo.png", width: 28,),
          )
        ],
      ) : IconButton(onPressed: () {
        key.currentState!.openDrawer();
      }, icon: const Icon(Icons.menu)),
      title: Row(
        children: [
          Visibility(child: CustomText(
            text: "Dashboard",
            color: lightGrey,
            size: 20,
            weight: FontWeight.bold,
          )),
          Expanded(child: Container()),
          IconButton(
            icon: Icon(Icons.settings, color: dark,),
            onPressed: () {

            },
          ),

          Stack(
            children: [
              IconButton(icon: Icon(Icons.notifications, color: dark.withOpacity(.7),), onPressed: (){}),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: active,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: light, width: 2)
                  ),
                ),
              )
            ],
          ),

          Container(
            width: 1,
            height: 22,
            color: lightGrey,
          ),

          const SizedBox(
            width: 24,
          ),

          CustomText(text: null != authController.userModel && authController.userModel!.name.isNotEmpty
              ? authController.userModel!.name : "John Doe", color: lightGrey,),

          const SizedBox(
            width: 16,
          ),

          Container(
            decoration: BoxDecoration(
                color: active.withOpacity(.5),
                borderRadius: BorderRadius.circular(30)
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              child: null != authController.userModel && authController.userModel!.photo.isNotEmpty
                ? Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(authController.userModel!.photo) ,
                    ),
                    ),
                    ) : CircleAvatar(
                backgroundColor: light,
                child: Icon(Icons.person_outline, color: dark,),
              )
            ),
          )
        ],
      ),

      iconTheme: IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );