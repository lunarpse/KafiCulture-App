class LadiesBagJsonModel {
  final int id;
  final String name;
  final String brand;
  final String description;
  final String rating;
  final String totalRatings;
  final String image;
  final double price;
  final String discount;
  final double offerPrice;
  final String category;

  LadiesBagJsonModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.rating,
    required this.totalRatings,
    required this.image,
    required this.price,
    required this.discount,
    required this.offerPrice,
    required this.category,
  });

  //deserialization
  factory LadiesBagJsonModel.fromJson(Map<String, dynamic> json) {
    return LadiesBagJsonModel(
      id: json['id'],
      name: json['name'],
      brand: json["brand"],
      description: json['description'],
      rating: json['rating'],
      totalRatings: json['totalRatings'],
      image: json['image'],
      price: json['price'],
      discount: json['discount'],
      offerPrice: json['offerPrice'],
      category: json['category'],
    );
  }
}
