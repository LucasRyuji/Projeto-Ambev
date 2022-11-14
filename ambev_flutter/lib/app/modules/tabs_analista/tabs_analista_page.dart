import 'package:ambev_flutter/app/global/helpers/app_colors.dart';
import 'package:ambev_flutter/app/modules/profile/profile_view.dart';
import 'package:ambev_flutter/app/modules/tabs_analista/tabs_analista_controller.dart';
import 'package:ambev_flutter/app/modules/users/index/users_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TabsAnalistaPage extends GetView<TabsAnalistaController> {
  @override
  var controller = Get.find<TabsAnalistaController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            backgroundColor: AppColors.light,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedItemColor: AppColors.primary,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.users),
                label: 'Usuários',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidUser),
                label: 'Perfil',
              ),
            ],
            onTap: (index) => controller.changePage(index),
          )),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.currentIndex.value,
                children: [
                  UsersPage(),
                  ProfilePage(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
