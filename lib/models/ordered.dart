import 'food.dart';

class Ordered {
  final int? id;
  final int foodId;
  final DateTime date;
  final int quantity;
  final Food? food;

  Ordered({
    this.id,
    required this.foodId,
    required this.date,
    required this.quantity,
    this.food,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'foodId': foodId,
      'date': date.toIso8601String(),
      'quantity': quantity,
    };
  }

  static Ordered fromMap(Map<String, dynamic> map, Food food) {
    return Ordered(
      id: map['id'],
      foodId: map['foodId'],
      date: DateTime.parse(map['date']),
      quantity: map['quantity'],
      food: food,
    );
  }

  @override
  String toString() {
    return 'Order{id: $id, foodId: $foodId, date: $date, quantity: $quantity, food: $food}';
  }
}
