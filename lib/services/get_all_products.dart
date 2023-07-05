// ignore_for_file: non_constant_identifier_names

import 'package:store_app/helper/api.dart';
import '../models/products_model.dart';

class AllProductsService {
  Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductsModel> ProductsList = [];
    for (int i = 0; i < data.length; i++) {
      ProductsList.add(
        ProductsModel.fromJson(data[i]),
      );
    }
    return ProductsList;
  }
}
