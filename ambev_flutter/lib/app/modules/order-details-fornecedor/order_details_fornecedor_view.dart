import 'package:ambev_flutter/app/global/helpers/app_colors.dart';
import 'package:ambev_flutter/app/global/helpers/app_styles.dart';
import 'package:ambev_flutter/app/modules/order-details-fornecedor/order_details_fornecedor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OrderDetailsFornecedorPage
    extends GetView<OrderDetailsFornecedorController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('DETALHES DO PEDIDO'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Colaborador',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                          ),
                        ),
                        TextFormField(
                          enabled: false,
                          readOnly: true,
                          initialValue: controller.order.user!.name,
                          decoration: AppStyles.inputDecoration,
                          keyboardType: TextInputType.datetime,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Data da viagem',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                          ),
                        ),
                        TextFormField(
                          enabled: false,
                          readOnly: true,
                          initialValue: DateFormat('dd/MM/yyyy')
                                          .format(controller.order.date),
                          decoration: AppStyles.inputDecoration,
                          keyboardType: TextInputType.datetime,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Hora da viagem',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                          ),
                        ),
                        TextFormField(
                          enabled: false,
                          readOnly: true,
                          initialValue: DateFormat('hh:mm').format(controller.order.date),
                          decoration: AppStyles.inputDecoration,
                          keyboardType: TextInputType.datetime,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Local de origem',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                          ),
                        ),
                        TextFormField(
                          enabled: false,
                          readOnly: true,
                          initialValue: controller.order.origin,
                          decoration: AppStyles.inputDecoration,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Local de destino',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                          ),
                        ),
                        TextFormField(
                          enabled: false,
                          readOnly: true,
                          decoration: AppStyles.inputDecoration,
                          initialValue: controller.order.destiny,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Conta',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                          ),
                        ),
                        TextFormField(
                          enabled: false,
                          readOnly: true,
                          decoration: AppStyles.inputDecoration,
                          initialValue: controller.order.account,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Centro de custos',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                          ),
                        ),
                        TextFormField(
                          enabled: false,
                          readOnly: true,
                          decoration: AppStyles.inputDecoration,
                          initialValue: controller.order.costCenter,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Observações',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                          ),
                        ),
                        TextFormField(
                          enabled: false,
                          readOnly: true,
                          decoration: AppStyles.inputDecoration,
                          initialValue: controller.order.obs,
                          keyboardType: TextInputType.text,
                          minLines: 5,
                          maxLines: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Veículo',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                          ),
                        ),
                        TextFormField(
                          controller: controller.carController,
                          decoration: AppStyles.inputDecoration,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veículo é obrigatório';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Motorista',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                          ),
                        ),
                        TextFormField(
                          controller: controller.driverController,
                          decoration: AppStyles.inputDecoration,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Motorista é obrigatório';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Valor',
                          style: TextStyle(
                            color: Color(0xff6C6C6C),
                          ),
                        ),
                        TextFormField(
                          controller: controller.valueController,
                          decoration: AppStyles.inputDecoration,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.save();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 40,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Center(
                              child: Obx(
                            () => Stack(
                              children: [
                                if (controller.loading.isFalse)
                                  const Text(
                                    'SALVAR',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                if (controller.loading.isTrue)
                                  RichText(
                                    text: TextSpan(
                                        text: 'AGUARDE ',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child:
                                                LoadingAnimationWidget.inkDrop(
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          )
                                        ]),
                                  )
                              ],
                            ),
                          )),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
