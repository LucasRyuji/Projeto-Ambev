import 'package:ambev_flutter/app/global/helpers/app_colors.dart';
import 'package:ambev_flutter/app/global/helpers/app_styles.dart';
import 'package:ambev_flutter/app/modules/users/edit/edit_users_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EditUsersPage extends GetView<EditUsersController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Criar usuário'),
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
                              'Nome',
                              style: TextStyle(
                                color: Color(0xff6C6C6C),
                              ),
                            ),
                            TextFormField(
                              decoration: AppStyles.inputDecoration,
                              controller: controller.nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nome é obrigatório';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'E-mail',
                              style: TextStyle(
                                color: Color(0xff6C6C6C),
                              ),
                            ),
                            TextFormField(
                              decoration: AppStyles.inputDecoration,
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'E-mail é obrigatório';
                                }
                                return EmailValidator.validate(value)
                                    ? null
                                    : 'E-mail inválido';
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Senha',
                              style: TextStyle(
                                color: Color(0xff6C6C6C),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Preencha apenas se for alterar',
                                  filled: true,
                                  fillColor: AppColors.light,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  )),
                              keyboardType: TextInputType.visiblePassword,
                              controller: controller.passwordController,
                              obscureText: true,
                              validator: (value) {
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Username',
                              style: TextStyle(
                                color: Color(0xff6C6C6C),
                              ),
                            ),
                            TextFormField(
                              decoration: AppStyles.inputDecoration,
                              controller: controller.usernameController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value == '') {
                                  return 'Username é obrigatório';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Nível de acesso',
                              style: TextStyle(
                                color: Color(0xff6C6C6C),
                              ),
                            ),
                            TextFormField(
                              onTap: () => controller.showAccessLevelSelect(),
                              readOnly: true,
                              decoration: AppStyles.inputDecoration,
                              controller: controller.accessLevelController,
                              validator: (dynamic value) {
                                if (value == null || value == '') {
                                  return 'Nível de acesso é obrigatório';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Stack(
                              children: [
                                Visibility(
                                  visible: true,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.save();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              40,
                                          child: Center(
                                              child: Obx(
                                            () => Stack(
                                              children: [
                                                if (controller.loading.isFalse)
                                                  const Text(
                                                    'ATUALIZAR',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                if (controller.loading.isTrue)
                                                  RichText(
                                                    text: TextSpan(
                                                        text: 'AGUARDE ',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        children: [
                                                          WidgetSpan(
                                                            alignment:
                                                                PlaceholderAlignment
                                                                    .middle,
                                                            child:
                                                                LoadingAnimationWidget
                                                                    .inkDrop(
                                                              color:
                                                                  Colors.white,
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
                                ),
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
                ),
              ],
            ),
          )),
    );
  }
}
