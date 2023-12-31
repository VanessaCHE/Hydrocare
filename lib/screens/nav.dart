import 'package:flutter/material.dart';
import 'package:univ_app/screens/aboutus.dart';
import 'package:univ_app/screens/home_screen.dart';
import 'package:univ_app/screens/signup.dart';
// import 'package:univ_app/screens/register.dart';
// import 'package:univ_app/screens/login.dart';
// import 'package:univ_app/screens/coorperate.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Home(),
    Home(),
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
        title: Text('HydroCare'),
      ),
      // body: Center(
      // child: Builder(
      //   builder:(context) => ElavatedButton(
      //     onpressed: (){
      //       Scaffold.of(context).openDrawer();

      //     },
      //     child: context Text('Profile'),
      //   )),
      // ),

      drawer: Drawer(
          child: ListView(children: [
        // UserAccountsDrawerHeader(accountName: const Text('Vee hjjn'),
        // accountEmail: const Text('ghh@gmail.com')),

        ListTile(
        
          title: const Text('Register'),
          onTap: () {
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => SignupPage())),
              );
            }
          },
        ),

        ListTile(
            title: const Text('About Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => Aboutus()),
                ),
              );
            }),
      ])),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
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
