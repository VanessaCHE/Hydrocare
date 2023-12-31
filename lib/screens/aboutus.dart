import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200, // Adjust the height as needed
            child: Image.asset(
              'assets/splash 5.jpg', // Replace with your image asset path
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16.0),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Company',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Hydrocare Mision',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Our Mission is to To provide accessible and affordable water solutions to underserved rural communities and urban areas, including Nairobi, with a commitment to ensuring a consistent and reliable water supply to homes and businesses. Our mission is rooted in the belief that access to clean water is a fundamental human right, and we strive to make a positive impact on peoples lives',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Values',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Access for all!',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'We believe that everyone deserves access to clean and affordable water. Our commitment is to reach underserved communities and urban areas, ensuring that no one is left behind.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
