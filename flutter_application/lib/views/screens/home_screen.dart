// import 'package:flutter/material.dart';
// import 'package:flutter_application/utils/save_datas.dart';
// import 'package:flutter_application/views/screens/camera_scan_screen.dart';
// import 'package:flutter_application/views/screens/text_qr.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final SaveDatas saveDatas = SaveDatas();
//   List<String> images = ['text.png', 'web.png'];

//   @override
//   void initState() {
//     super.initState();
//     loadSavedData();
//   }

//   Future<void> loadSavedData() async {
//     var data = await saveDatas.loadSavedData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Generate QR'),
//         actions: const [
//           Icon(Icons.menu),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           ...List.generate(2, (int index) {
//             return GestureDetector(
//               onTap: () {
//                 switch (index) {
//                   case 0:
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const TextQr()));
//                   case 1:
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const CameraScanScreen()));
//                     break;
//                   default:
//                 }
//               },
//               child: Container(
//                 margin: const EdgeInsets.all(10),
//                 alignment: Alignment.center,
//                 child: Container(
//                   padding: const EdgeInsets.all(80),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     border: Border.all(
//                       color: const Color(0xFFFDB623),
//                     ),
//                     color: const Color(0xFF333333),
//                   ),
//                   child: Image.asset(
//                     'assets/images/${images[index]}',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             );
//           })
//         ],
//       ),
//     );
//   }
// }
