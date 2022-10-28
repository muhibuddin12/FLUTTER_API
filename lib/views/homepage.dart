import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api/controllers/productcontroller.dart';
import 'package:flutter_api/views/product_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ProductController productController = Get.put(ProductController());

  // Widget Tile({required int index}) {
  //   return Container(
  //     height: 200,
  //     color: Colors.amber,
  //     alignment: Alignment.center,
  //     child: Text(
  //       index.toString(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, right: 15, left: 15, bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new,
                  size: 25,
                  color: Colors.black,
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child:
                      Icon(Icons.shopping_cart, size: 25, color: Colors.black),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "ShopM",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.view_list_rounded,
                      size: 25,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.grid_view,
                      size: 25,
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Obx(() => MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          shrinkWrap: true,
                          itemCount: productController.productList.length,
                          itemBuilder: (context, index) {
                            return ProductTile(
                                product: productController.productList[index]);
                          },
                        ))))
          ],
        ),
      ),
    );
  }
}
