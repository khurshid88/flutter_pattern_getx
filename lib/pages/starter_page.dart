import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/starter_controller.dart';
import '../model/post_model.dart';
import '../views/item_starter_post.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {

  @override
  void initState() {
    super.initState();
    Get.find<StarterController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
      ),
      body: GetBuilder<StarterController>(
          init: StarterController(),
        builder: (controller){
            return Stack(
              children: [
                ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (ctx, index) {
                    Post post = controller.items[index];
                    return itemStarterPost(controller, post);
                  },
                ),
                controller.isLoading
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
