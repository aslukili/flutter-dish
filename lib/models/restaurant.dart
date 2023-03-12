import '/models/food.dart';

class Restaurant {
  final String? imageUrl;
  final String? name;
  final String? address;
  final int? rating;
  final List<Food>? menu;

  Restaurant({
    this.imageUrl,
    this.name,
    this.address,
    this.rating,
    this.menu,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'address': address,
      'rating': rating,
      'menu': menu?.map((food) => food.toMap())?.toList(),
    };
  }

  static Restaurant fromMap(Map<String, dynamic> map) {
    return Restaurant(
      imageUrl: map['imageUrl'],
      name: map['name'],
      address: map['address'],
      rating: map['rating'],
      menu: (map['menu'] as List<Map<String, dynamic>>?)
          ?.map((food) => Food.fromMap(food))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'Restaurant{imageUrl: $imageUrl, name: $name, address: $address, rating: $rating, menu: $menu}';
  }
}
