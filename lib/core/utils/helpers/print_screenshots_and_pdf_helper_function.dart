// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_to_pdf/export_delegate.dart';
// import 'package:flutter_to_pdf/export_frame.dart';
// import 'package:path_provider/path_provider.dart';

// class PrintScreenShotsAndPdfHelperFunction {
// // ? Create an instance of the ExportDelegate
// // ? wrap your widget with a ExportFrame widget and provide a frameId, as well as the exportDelegate.

// static  Future<File> getPdf({required Widget widget}) async {
// // ?create instance of ExportDelegate
//     final ExportDelegate exportDelegate = ExportDelegate();

//     ExportFrame(
//       exportDelegate: exportDelegate,
//       frameId: 'someFrameId',
//       child: widget, // the widget you want to export
//     );

// //? export the frame to a PDF Document
//     var pdf = await exportDelegate.exportToPdfDocument('someFrameId');
// //? convert uint8list to file 
//  Uint8List bytes=  await   pdf.save();
//   final tempDir = await getTemporaryDirectory();
//   final file = File('${tempDir.path}/filename.pdf');
//   return await file.writeAsBytes(bytes);





//   }
// }
