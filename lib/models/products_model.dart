class ProductsModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  //final RatingModel rating;

  ProductsModel({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
    //required this.rating
  });

  factory ProductsModel.fromJson(JsonData) {
    return ProductsModel(
      id: JsonData['id'],
      title: JsonData['title'],
      price: JsonData['price'],
      description: JsonData['description'],
      category: JsonData['category'],
      image: JsonData['image'],
      // rating: RatingModel.fromJson(JsonData['rating'],
    );
  }
}

// class RatingModel {
//   final num rate;
//   final int count;

//   RatingModel({
//      required this.count,
//      required this.rate
//      });

//   factory RatingModel.fromJson(JsonData) {
//     return RatingModel(
//       rate: JsonData['rate'],
//       count: JsonData['count'],
//     );
//   }
// }
