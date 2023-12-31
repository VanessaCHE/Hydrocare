import 'package:univ_app/models/water_measurements.dart';

class Cart {
  final String userId;
  final List<CartItem> cartItems;

  Cart({
    required this.userId,
    required this.cartItems, required List<Product> products,
  });

  // Factory method to convert a map from Firestore to a Cart
  factory Cart.fromFirestore(String userId, Map<String, dynamic> data) {
    final List<CartItem> cartItems = List<CartItem>.from(
      (data['cartItems'] as List<dynamic>? ?? []).map(
        (item) => CartItem.fromFirestore(item),
      ),
    );

    return Cart(userId: userId, cartItems: cartItems, products: []);
  }

  // Method to convert a Cart to a map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'cartItems': cartItems.map((item) => item.toFirestore()).toList(),
    };
  }
}

class CartItem {
  final String productId;
  final String productName;
  final double price;
  final int quantity;

  CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
  });

  // Factory method to convert a map from Firestore to a CartItem
  factory CartItem.fromFirestore(Map<String, dynamic> data) {
    return CartItem(
      productId: data['productId'],
      productName: data['productName'],
      price: data['price'].toDouble(),
      quantity: data['quantity'],
    );
  }

  // Method to convert a CartItem to a map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'productId': productId,
      'productName': productName,
      'price': price,
      'quantity': quantity,
    };
  }
}
