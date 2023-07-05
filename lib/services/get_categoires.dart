// ignore_for_file: missing_required_param

import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/categories',
    );

    return data;
  }
}
