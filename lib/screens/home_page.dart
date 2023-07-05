import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/get_all_products.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ProductsModel? _model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text('New Trend', style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.black,
                size: 19,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 12, left: 12, top: 60),
          child: FutureBuilder<List<ProductsModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductsModel> products = snapshot.data!;
                return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.6,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 60,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: products[index],
                      );
                    });
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                ));
              }
            },
          ),
        ));
  }
}
