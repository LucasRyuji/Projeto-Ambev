import 'package:ambev_flutter/app/global/helpers/app_colors.dart';
import 'package:ambev_flutter/app/modules/orders-colaborador/index/orders_colaborador_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';

class OrdersColaboradorPage extends GetView<OrdersColaboradorController> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('PEDIDOS'),
          actions: [
            IconButton(
              onPressed: () {
                controller.refreshOrders();
              },
              icon: const Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () {
                controller.create();
              },
              icon: const Icon(Icons.add_box),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Stack(
                children: [
                  if (controller.loading.isTrue)
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            height: 100,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            height: 100,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            height: 100,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            height: 100,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            height: 100,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            height: 100,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  if (controller.loading.isFalse)
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          itemCount: controller.orders.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: ((_, index) {
                            var order = controller.orders[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed('order-details-colaborador',
                                      arguments: {
                                        'order': order,
                                      });
                                },
                                child: Card(
                                  color: Colors.grey.shade200,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: (width) * 0.15,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    DateFormat('dd')
                                                        .format(order.date),
                                                    style: const TextStyle(
                                                      fontSize: 30,
                                                    ),
                                                  ),
                                                  Text(
                                                    DateFormat('MMM')
                                                        .format(order.date),
                                                  ),
                                                  Text(
                                                    DateFormat('HH:mm')
                                                        .format(order.date),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: (width - 40) * 0.3,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Origem',
                                                    style: TextStyle(
                                                        color: AppColors.medium,
                                                        fontSize: 12),
                                                  ),
                                                  Text(order.origin),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    'Observa????es',
                                                    style: TextStyle(
                                                        color: AppColors.medium,
                                                        fontSize: 12),
                                                  ),
                                                  Text(order.obs != null &&
                                                          order.obs!.isNotEmpty
                                                      ? order.obs!.length > 10
                                                          ? order.obs!
                                                                  .substring(
                                                                      0, 10) +
                                                              '...'
                                                          : order.obs!
                                                      : '---'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: (width) * 0.3,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Destino',
                                                    style: TextStyle(
                                                      color: AppColors.medium,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(order.destiny),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    'Status do pedido',
                                                    style: TextStyle(
                                                      color: AppColors.medium,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(order.status!.name!),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            );
                          }),
                        ),
                        if (controller.orders.isEmpty)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Nenhum pedido encontrado.'),
                            ],
                          )
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
