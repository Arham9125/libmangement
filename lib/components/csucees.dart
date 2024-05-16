// import 'package:flutter/material.dart';
// import 'package:sweetsheet/sweetsheet.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// class consucess extends StatelessWidget {
//   const consucess({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  _sweetSheet.show(
//     context: context,
//     title: Text("Attention"),
//     description: Text(
//         'Your app is not connected to internet actually, please turn on Wifi/Celullar data.'),
//     color: SweetSheetColor.WARNING,
//     icon: Icons.portable_wifi_off,
//     positive: SweetSheetAction(
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//       title: 'OPEN SETTING',
//       icon: Icons.open_in_new,
//     ),
//     negative: SweetSheetAction(
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//       title: 'CANCEL',
//     ),
// );
//   }
// }