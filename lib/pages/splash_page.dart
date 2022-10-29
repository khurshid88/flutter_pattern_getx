import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';
import '../controllers/starter_controller.dart';
import '../model/post_model.dart';
import '../views/item_splash_post.dart';
import '../views/item_starter_post.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Get.find<SplashController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
      ),
      body: GetX<SplashController>(
          init: SplashController(),
        builder: (controller){
            return Stack(
              children: [
                ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (ctx, index) {
                    Post post = controller.items[index];
                    return itemSplashPost(controller, post);
                  },
                ),
                controller.isLoading.value
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : const SizedBox.shrink(),
              ],
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
