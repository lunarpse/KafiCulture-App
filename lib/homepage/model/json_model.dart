class AddonModel {
  final String addonsName;
  final String price;

  AddonModel({required this.addonsName, required this.price});

  factory AddonModel.fromJson(Map<String, dynamic> json) {
    return AddonModel(addonsName: json['addonsName'], price: json['price']);
  }
}

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
  final List<AddonModel> addons;

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
    required this.addons,
  });

  //deserialization
  factory JsonModel.fromJson(Map<String, dynamic> json) {
    List<AddonModel> parseAddons = [];
    if (json['addons'] != null) {
      for (var addon in json["addons"]) {
        parseAddons.add(AddonModel.fromJson(addon));
      }
    }
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
      addons: parseAddons,
    );
  }
}
