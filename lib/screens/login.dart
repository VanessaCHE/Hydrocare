
import 'package:flutter/material.dart';

class Lagin extends StatefulWidget {
  const Lagin({super.key});

  @override
  State<Lagin> createState() => _LaginState();
}

class _LaginState extends State<Lagin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
    appBar: AppBar(
      backgroundColor: Colors.blue,
    ),
    );
  }
}



// import 'package:flutter/material.dart';

// class Lagin extends StatefulWidget {
//   const Lagin({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HOME '),
//         centerTitle: true), // Center the title
//       body: const Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 49, horizontal: 90),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Enter Username",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               // Adjust the width as needed
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Enter Password",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
  // child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
            
            
  //           TextField(
  //             decoration: InputDecoration(
  //               hintText: "Enter Username",
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 4,
  //           ),
  //           // Adjust the width as needed
  //           TextField(
  //             decoration: InputDecoration(
  //               hintText: "Enter Username",
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
            
  //         ],
          
  //       ),