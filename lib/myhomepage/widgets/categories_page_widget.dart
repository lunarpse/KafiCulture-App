// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';

// class CategoriesPageWidget extends StatelessWidget {
//   const CategoriesPageWidget(
//       {super.key, required this.categories, this.routingPage});

//   final categories;
//   final routingPage;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       // physics: NeverScrollableScrollPhysics(),
//       itemCount: categories.length,
//       itemBuilder: (context, index) {
//         var category = categories[index];
//         final name = category.name;
//         final image = category.image;
//         final description = category.description;
//         final totalRating = category.totalRatings;
//         final rating = category.rating;
//         final price = category.price;
//         double foodRating = double.parse(totalRating);
//         return Padding(
//           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5),
//                 child: Container(
//                   width: 380,
//                   height: 170,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey,
//                           spreadRadius: 3,
//                           blurRadius: 10,
//                           offset: Offset(0, 3),
//                         )
//                       ]),
//                   child: InkWell(
//                     onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => routingPage,
//                         )),
//                     child: Row(
//                       children: [
//                         Container(
//                           alignment: Alignment.center,
//                           child: Expanded(
//                             child: Image.asset(
//                               "assets/images/$image.jpg",
//                               height: 160,
//                               width: 180,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 12,
//                         ),
//                         Container(
//                           width: 175,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 name,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 "Discover the artistry of flavors, where every sip is a celebration of perfection.",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   // fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: List.generate(5, (index) {
//                                       return Icon(
//                                         index < foodRating.toInt()
//                                             ? Icons.star
//                                             : Icons.star_border,
//                                         color: Colors.amber,
//                                         size: 18,
//                                       );
//                                     }),
//                                   ),
//                                   Text(
//                                     "($totalRating Ratings)",
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ],
//                               ),
//                               Text(
//                                 rating,
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   color: Colors.red,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
