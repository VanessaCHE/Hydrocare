class Product {
  final String id;
  final String name;
  final int amount;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.amount,
    required this.price,
  });

  static fromFirestore(Map<String, dynamic> data) {}
}


