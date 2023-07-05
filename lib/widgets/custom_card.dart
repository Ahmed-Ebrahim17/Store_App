import 'package:flutter/material.dart';
import 'package:store_app/animation/route_builder.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/update_product.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    super.key,
  });

  ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(10, 13),
            color: Colors.grey.withOpacity(0.1),
          ),
        ]),
        child: InkWell(
          splashColor: Colors.deepOrange,
          onTap: () {
            Navigator.push(
              context,
              createRoute(UpdateProductPage(
                product: product,
              )),
            );
          },
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.title.substring(0, 11),
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ ${product.price.toString()}'),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            size: 18,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
        right: 23,
        bottom: 70,
        child: Image.network(
          product.image,
          height: 87,
          width: 87,
        ),
      ),
    ]);
  }
}
