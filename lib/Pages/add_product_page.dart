import 'package:e_commerce_flutter/widgets/dropdown_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: Text('Add Product'),),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10.0),
            // width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Add New Product', style: TextStyle(fontSize: 30,
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold),),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      label: Text('Product Name'),
                      hintText: 'Enter Your Product Name'
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      label: Text('Product Description'),
                      hintText: 'Enter Your Product Description'
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: ctrl.productImageCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      label: Text('Image Url'),
                      hintText: 'Enter Your Product Image Url'
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      label: Text('Product Price'),
                      hintText: 'Enter Your Product Price'
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child: DropDownBtn(
                      items: ['Cloaths', 'Footware', 'jewellery','Electronics','Perfume'],
                      selectedItemText: ctrl.category,
                      onSelected: (selectedValue) {
                        ctrl.category = selectedValue ?? 'general';
                        ctrl.update();
                      },)),
                    Flexible(child: DropDownBtn(
                      items: ['Gucci', 'Nike', 'Tanishq','LG','Chanel'],
                      selectedItemText: ctrl.brand,
                      onSelected: (selectedValue) {
                        ctrl.brand = selectedValue ?? 'un branded';
                        ctrl.update();
                      },)),
                  ],
                ),
                SizedBox(height: 10.0),
                Text('Offer Product ?'),
                SizedBox(height: 10.0),
                DropDownBtn(items: ['true', 'false'],
                  selectedItemText: ctrl.offer.toString(),
                  onSelected: (selectedValue) {
                  ctrl.offer = bool.tryParse(selectedValue ?? 'false') ?? false;
                  ctrl.update();
                  },),
                SizedBox(height: 10.0),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white
                    ),
                    onPressed: () {
                        ctrl.addProduct();
                    }, child: Text('Add Product'))

              ],
            ),
          ),
        ),
      );
    });
  }
}
