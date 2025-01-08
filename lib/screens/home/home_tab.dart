// import 'package:flutter/material.dart';

// class HomeTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Search Bar
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: 'Search...',
//               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//               prefixIcon: Icon(Icons.search),
//             ),
//           ),
//         ),

//         // Sliding Banner
//         Container(
//           height: 150,
//           child: PageView(
//             children: [
//               Image.network(
//                 'https://via.placeholder.com/300x150',
//                 fit: BoxFit.cover,
//               ),
//               Image.network(
//                 'https://via.placeholder.com/300x150/FF0000',
//                 fit: BoxFit.cover,
//               ),
//             ],
//           ),
//         ),

//         // Product Grid
//         Expanded(
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//             ),
//             itemCount: 10,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Image.network(
//                         'https://via.placeholder.com/150',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Text('Product $index'),
//                     Text('\$${(index + 1) * 10}'),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
