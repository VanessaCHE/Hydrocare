// bottom_nav.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:univ_app/models/cart_item.dart';

import 'package:univ_app/models/water_measurements.dart';
import 'package:univ_app/screens/cart.dart';
import 'package:univ_app/screens/login.dart';
import 'package:univ_app/screens/profile.dart';
import 'package:univ_app/screens/search_screen.dart';
import 'package:univ_app/models/water_service.dart';
import 'package:univ_app/models/cart_item.dart'; // Adjust the import based on your file structure

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key, required onTap, required int currentIndex})
      : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final WaterService _waterService = WaterService();

  final List<Product> products = [
    Product(
        name: 'Water Bowser',
        amount: 5000,
        price: 3000,
        id: 'u5UxDjDCpWCjCqDCbByK'),
    Product(
        name: 'Water Bowser',
        amount: 3000,
        price: 2000,
        id: 'uB2xTfSYtEUij99R3NAn'),
    Product(
        name: 'Water Bowser',
        amount: 2000,
        price: 1500,
        id: 'uzbMz6MEnJZpTumTaIkq'),
  ];

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      ProductDetailPage(products: products),
       MyHomePage(),
       ProfilePage(),
    ];
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order More Water'),
        actions: [
          if (_selectedIndex == 0)
            IconButton(
              onPressed: () async {
                // Fetch the user ID
                String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
                // Fetch the current cart
                Cart? currentCart = await _waterService.getCart(userId);

                // Navigate to the cart page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cart: currentCart, cartItem: null,),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}

