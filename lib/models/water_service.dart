// water_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:univ_app/models/cart_item.dart';
import 'package:univ_app/models/water_measurements.dart';

class WaterService {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('carts');

  Future<List<Product>> getProducts() async {
    QuerySnapshot productSnap = await productCollection.get();
    return productSnap.docs
        .map((doc) => Product(
              id: doc.id,
              name: doc['name'],
              amount: doc['amount'],
              price: doc['price'],
              
            ))
        .toList();
  }

  Future<void> addToCart(String userId, List<Product> products) async {
    await cartCollection.doc(userId).set({
      'products': products
          .map((product) => {
                'id': product.id,
                'name': product.name,
                'amount': product.amount,
                'price': product.price,
               
              })
          .toList(),
    });
  }

  Future<Cart?> getCart(String userId) async {
    DocumentSnapshot cartDoc = await cartCollection.doc(userId).get();
    if (cartDoc.exists) {
      List<Product> products = (cartDoc['products'] as List<dynamic>)
          .map((product) => Product(
                id: product['id'],
                name: product['name'],
                amount: product['amount'],
                price: product['price'],
                
              ))
          .toList();
      return Cart(products: products, userId: '', cartItems: []);
    } else {
      return null;
    }
  }
}


