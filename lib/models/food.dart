class Food {
  final String? imageUrl;
  final String? name;
  final double? price;

  Food({
    this.imageUrl,
    this.name,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
    };
  }

  static Food fromMap(Map<String, dynamic> map) {
    return Food(
      imageUrl: map['imageUrl'],
      name: map['name'],
      price: map['price'],
    );
  }

  @override
  String toString() {
    return 'Food{imageUrl: $imageUrl, name: $name, price: $price}';
  }
}
