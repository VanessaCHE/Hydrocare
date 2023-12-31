
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:univ_app/models/cart_item.dart';

class CartService {
  final CollectionReference _cartsCollection =
      FirebaseFirestore.instance.collection('carts');

  Future<Cart> getCartByUserId(String userId) async {
    DocumentSnapshot cartDoc = await _cartsCollection.doc(userId).get();
    return Cart.fromFirestore(userId, cartDoc.data() as Map<String, dynamic>);
  }

  Future<void> updateCart(Cart cart) async {
    await _cartsCollection.doc(cart.userId).set(cart.toFirestore());
  }
}
