// ignore_for_file: missing_required_param

import '../helper/api.dart';
import '../models/products_model.dart';

class UpdateProductService {
  Future<ProductsModel> updateProduct(
      {required String title,
      required dynamic price,
      required String desc,
      required dynamic id,
      required String image,
      required String category}) async {
    print('id:$id');

    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'id': id.toString(),
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductsModel.fromJson(data);
  }
}
