import 'package:flutter/material.dart';
import 'package:univ_app/screens/coorperate.dart';
import 'package:univ_app/screens/login.dart';
import 'package:univ_app/screens/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key, required int currentIndex, required Null Function(dynamic index) onTap});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const Lagin(),
    const Coorp(),
    const Profile(),
  ];

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
            icon: Icon(Icons.business),
            label: 'Coorperate',
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