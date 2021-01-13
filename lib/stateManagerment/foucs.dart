// import 'package:flutter/material.dart';

// class MarkTextField extends StatefulWidget {
//   @override
//   _MarkTextFieldState createState() => _MarkTextFieldState();
// }

// class _MarkTextFieldState extends State<MarkTextField> {
//   FocusNode textField_Focus = FocusNode();
//   FocusNode focusWidget_Focus = FocusNode();
//   FocusNode children_Focus = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         FloatingActionButton(
//           onPressed: () {
//             //포크스 해지.
//             textField_Focus.unfocus();
//             // children_Focus = focusWidget_Focus.children.last;
//             // 포크스 상태 출력.
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               debugDumpFocusTree();
//             });
//           },
//           child: Text('data'),
//         ),
//         Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('first children'),
//               // Stack(
//               //   children: [Positioned(child: Text('middle children'))],
//               // ),
//               Text('last children'),
//             ],
//           ),
//         ),
//         TextField(
//           focusNode: textField_Focus,
//         )
//       ],
//     );
//   }
// }
