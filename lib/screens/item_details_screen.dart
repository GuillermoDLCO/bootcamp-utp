import 'package:flutter/material.dart';

import 'package:bootcamp_utp/models/item.dart';

class ItemDetailsScreenArguments {
  ItemDetailsScreenArguments({
    required this.item,
  });
  final Item item;
}

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  static Widget create(
      BuildContext context, ItemDetailsScreenArguments arguments) {
    return ItemDetailsScreen(item: arguments.item);
  }

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/image_background.png',
              width: double.infinity,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                  color: Colors.blue,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .67,
                child: Center(child: Text(item.name)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
