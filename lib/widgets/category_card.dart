// import 'package:dreamslasher/models/category.dart';
// import 'package:flutter/material.dart';

// class CategoryCard extends StatelessWidget {
//   const CategoryCard({Key? key, required this.category}) : super(key: key);

//   final Category category;

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.65,
//       child: Container(
//         decoration: BoxDecoration(
//           color: category.backgroundColor,
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(32),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Spacer(),
//                     Text(
//                       category.title,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const Spacer(),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: const Color(0xFF6BBFB0),
//                         onPrimary: Colors.white,
//                         textStyle: const TextStyle(
//                           fontSize: 10,
//                         ),
//                       ),
//                       child: Text(
//                         category.btnText,
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).pushNamed(category.onClick);
//                       },
//                     ),
//                     const Spacer(),
//                   ],
//                 ),
//               ),
//             ),
//             // AspectRatio(
//             //   aspectRatio: 0.71,
//             Image.asset(
//               category.imageSrc,
//               fit: BoxFit.cover,
//               height: 150,
//             ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
