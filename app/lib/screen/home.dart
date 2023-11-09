// import 'package:app/utils/constants1.dart';
// import 'package:app/widgets/card_item.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF9F7FFF),
//       body: _buildBody(context),
//     );
//   }

//   _buildBody(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20.0),
//                 child: Text(
//                   "Choose Question Type",
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 0, 0, 0),
//                     fontSize: 30,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           _buildCategoriesGrid(technologiesList),
//           const SizedBox(
//             height: 20,
//           ),
//           _buildCategoriesGrid(subjectList)
//         ],
//       ),
//     );
//   }

//   _buildCategoriesGrid(List<Map<String, String>> data) {
//     return GridView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       itemCount: data.length,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, childAspectRatio: 1),
//       itemBuilder: (context, index) {
//         final item = data[index];
//         return CardItemWidget(
//           title: item["name"] ?? "",
//           titlecolor: const Color.fromARGB(255, 0, 0, 0),
//           cardColor: const Color.fromARGB(255, 255, 255, 255),
//           imagePath: item["image"] ?? "",
//           onPressed: () {
//             item["onPressed"];
//           },
//         );
//       },
//     );
//   }
// }
