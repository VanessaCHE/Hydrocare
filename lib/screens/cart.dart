import 'package:flutter/material.dart';
import 'package:univ_app/models/cart_item.dart';

class CartPage extends StatelessWidget {
  final CartItem? cartItem;

  CartPage({Key? key, required this.cartItem, Cart? cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartItem != null
          ? Card(
              child: ListTile(
                title: Text(cartItem!.productName),
                subtitle: Text(
                  'Price: \$${cartItem!.price}, Quantity: ${cartItem!.quantity}',
                ),
              ),
            )
          : Center(
              child: Text('Your cart is empty.'),
            ),
    );
  }
}

