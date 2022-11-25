import 'package:ambev_flutter/app/global/helpers/app_colors.dart';
import 'package:ambev_flutter/app/modules/orders-colaborador/index/orders_colaborador_view.dart';
import 'package:ambev_flutter/app/modules/profile/profile_view.dart';
import 'package:ambev_flutter/app/modules/tabs_colaborador/tabs_colaborador_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TabsColaboradorPage extends GetView<TabsColaboradorController> {
  @override
  var controller = Get.find<TabsColaboradorController>();

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
                icon: FaIcon(FontAwesomeIcons.ticket),
                label: 'Pedidos',
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
                  OrdersColaboradorPage(),
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
