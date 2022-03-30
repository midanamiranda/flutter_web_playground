import 'package:complete_web_course/constants/controllers.dart';
import 'package:complete_web_course/helpers/responsiveness.dart';
import 'package:complete_web_course/pages/clients/widgets/clients_table.dart';
import 'package:complete_web_course/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(() => Row(
            children: [
              Container(
                  margin: EdgeInsets.only(top:
                  ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(text: menuController.activeItem.value, size: 24, weight: FontWeight.bold,)),
            ],
          ),),

          Expanded(child: ListView(
            children: [
              Clientstable(),
            ],
          )),

        ],
      ),
    );
  }
}