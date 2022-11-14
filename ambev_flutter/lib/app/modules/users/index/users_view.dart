import 'package:ambev_flutter/app/global/helpers/app_colors.dart';
import 'package:ambev_flutter/app/modules/users/index/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skeletons/skeletons.dart';

class UsersPage extends GetView<UsersController> {
  @override
  var controller = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Usuários'),
            actions: [
              IconButton(
                onPressed: () {
                  controller.create();
                },
                icon: const Icon(Icons.add_box),
              )
            ],
          ),
          body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: controller.scrollController,
              child: Obx(
                () => Stack(
                  children: [
                    Visibility(
                      visible: controller.loading.isFalse,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: width*0.89,
                              child: TextField(
                                controller: controller.nameController,
                                onChanged:(_) {
                                  controller.getUsers(refresher: true);
                                },
                                decoration: InputDecoration(
                                  floatingLabelStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  labelText: 'Pesquisar',
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
                                  ),
                                  hintText: 'nome...'
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ListView.builder(
                              itemCount: controller.users.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: ((context, index) {
                                var user = controller.users[index];

                                return Card(
                                  color: AppColors.light,
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${user.name}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              "${user.email}",
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              "${user.accessLevelName}",
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  onPressed: () {
                                                    controller.edit(user);
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.blueAccent,
                                                    size: 20,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    controller.delete(
                                                        user, context);
                                                  },
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.redAccent,
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Visibility(
                              visible: controller.loadingPagination.isTrue,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: LoadingAnimationWidget.waveDots(
                                  color: AppColors.medium,
                                  size: 50,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: controller.loading.isTrue,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: ((_, __) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: SkeletonAvatar(
                                    style: SkeletonAvatarStyle(
                                      borderRadius: BorderRadius.circular(4),
                                      height: 80,
                                      width: double.infinity,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
