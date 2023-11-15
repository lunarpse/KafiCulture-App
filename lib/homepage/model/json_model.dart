class JsonModel {
  final int id;
  final String name;
  final String description;
  final String rating;
  final String totalRatings;
  final String image;
  final String price;
  final String discount;
  final String offerPrice;
  final String veg;
  final String category;

  JsonModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.totalRatings,
    required this.image,
    required this.price,
    required this.discount,
    required this.offerPrice,
    required this.veg,
    required this.category,
  });

  //deserialization
  factory JsonModel.fromJson(Map<String, dynamic> json) {
    return JsonModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      rating: json['rating'],
      totalRatings: json['totalRatings'],
      image: json['image'],
      price: json['price'],
      discount: json['discount'],
      offerPrice: json['offerPrice'],
      veg: json['veg'],
      category: json['category'],
    );
  }
}
