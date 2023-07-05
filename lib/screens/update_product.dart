import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/Update_product_service.dart';
import 'package:store_app/widgets/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/widgets/show%20_snackBar.dart';

import '../widgets/custom_button.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key, required this.product});
  ProductsModel product;

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productname;

  String? descprition;

  dynamic price;

  String? image;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                CustomTextField(
                  onChanged: (data) {
                    productname = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    descprition = data;
                  },
                  hintText: 'Descreption',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'Image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 180,
                ),
                CustomButton(
                  onpressed: () async {
                    isLoading = true;
                    setState(() {});
                    await updateProduct();
                    try {
                      await updateProduct();
                      showSnackBar(context, "Successful", Colors.green);
                      Navigator.of(context).pop();
                      print(productname);
                    } catch (e) {
                      print(e.toString());
                    }

                    isLoading = false;
                    setState(() {});
                  },
                  text: 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct() async {
    await UpdateProductService().updateProduct(
        id: widget.product.id,
        title: productname == null ? widget.product.title : productname!,
        price: price == null ? widget.product.price : price!,
        desc: descprition == null ? widget.product.description : descprition!,
        image: image == null ? widget.product.image : image!,
        category: widget.product.category);
  }
}
