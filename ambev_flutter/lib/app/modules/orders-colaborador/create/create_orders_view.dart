import 'package:ambev_flutter/app/global/helpers/app_colors.dart';
import 'package:ambev_flutter/app/global/helpers/app_styles.dart';
import 'package:ambev_flutter/app/modules/orders-colaborador/create/create_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CreateOrdersPage extends GetView<CreateOrdersController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('SOLICITAR SERVIÇO'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              'Data da viagem',
                              style: TextStyle(
                                color: Color(0xff6C6C6C),
                              ),
                            ),
                            TextFormField(
                              controller: controller.dateController,
                              decoration: AppStyles.inputDecoration,
                              keyboardType: TextInputType.datetime,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('dd/MM/yyyy')
                                          .format(pickedDate);

                                  controller.dateController.text =
                                      formattedDate; //set output date to TextField value.
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data é obrigatório';
                                }
                                if (value.length < 10) {
                                  return 'Data é inválida';
                                }
                                try {
                                  DateFormat('dd/MM/yyyy').parse(value);
                                } catch (e) {
                                  return 'Data é inválida';
                                }
                                return null;
                              },
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
                              controller: controller.timeController,
                              decoration: AppStyles.inputDecoration,
                              keyboardType: TextInputType.datetime,
                              onTap: () async {
                                var pickedDate = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );

                                if (pickedDate != null) {
                                  var formatter =
                                      MaterialLocalizations.of(context);

                                  controller.timeController.text =
                                      formatter.formatTimeOfDay(
                                          pickedDate); //set output date to TextField value.
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Hora é obrigatório';
                                }
                                if (value.length < 5) {
                                  return 'Hora é inválida';
                                }
                                try {
                                  TimeOfDay(
                                      hour: int.parse(value.split(':')[0]),
                                      minute: int.parse(value.split(':')[1]));
                                } catch (e) {
                                  return 'Hora é inválida';
                                }
                                return null;
                              },
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
                              decoration: AppStyles.inputDecoration,
                              controller: controller.originController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Local de origem é obrigatório';
                                }
                                return null;
                              },
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
                              decoration: AppStyles.inputDecoration,
                              controller: controller.destinyController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Local de destino é obrigatório';
                                }
                                return null;
                              },
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
                              decoration: AppStyles.inputDecoration,
                              controller: controller.accountController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Conta é obrigatório';
                                }
                                return null;
                              },
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
                              decoration: AppStyles.inputDecoration,
                              controller: controller.costCenterController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Centro de custos é obrigatório';
                                }
                                return null;
                              },
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
                              decoration: AppStyles.inputDecoration,
                              controller: controller.obsController,
                              keyboardType: TextInputType.text,
                              minLines: 10,
                              maxLines: 20,
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
                                                child: LoadingAnimationWidget
                                                    .inkDrop(
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
              ],
            ),
          )),
    );
  }
}
