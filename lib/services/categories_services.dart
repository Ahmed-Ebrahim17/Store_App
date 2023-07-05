// ignore_for_file: missing_required_param, non_constant_identifier_names

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class CategoryService {
  Future<List<ProductsModel>> getAllProducts(
      {required String category_name}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category_name');

    List<ProductsModel> ProductsList = [];
    for (int i = 0; i < data.length; i++) {
      ProductsList.add(
        ProductsModel.fromJson(data[i]),
      );
    }
    return ProductsList;
  }
}
