import 'package:e_commerce_flutter/Pages/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Product Admin'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(ctrl.products[index].name ?? ''),
              subtitle: Text((ctrl.products[index].price ?? 0).toString()),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  ctrl.deleteProduct(ctrl.products[index].id ?? '');
                },
              ),
            );
          },
          itemCount: ctrl.products.length,
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.to(const AddProductPage());
        }, child: Icon(Icons.add),),
      );
    });
  }
}
