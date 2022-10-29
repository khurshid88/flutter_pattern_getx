
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_getx/controllers/home_controller.dart';
import 'package:pattern_getx/controllers/starter_controller.dart';

import '../model/post_model.dart';

Widget itemStarterPost(StarterController _controller,Post post) {
  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(onDismissed: () {}),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {},
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "Update",
        )
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          // An action can be bigger than the others.
          onPressed: (BuildContext context) {
            _controller.apiPostDelete(post);
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title.toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            post.body,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    ),
  );
}