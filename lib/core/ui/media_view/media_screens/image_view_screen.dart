import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:overscroll_pop/overscroll_pop.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pos_app/core/ui/widget/custom_container_button_widget.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';
import 'package:pos_app/core/utils/extensions/widget_extensions.dart';
import 'package:pos_app/core/utils/helpers/media_helper.dart';

class ImageViewScreen extends StatefulWidget {
  static const String routeName = "image_view_screen";
  File? imageFile;

  ImageViewScreen({
    this.imageFile,
    super.key,
    required this.arg,
  });

  final ImageViewScreenParams arg;

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  final ValueNotifier<bool> isShow = ValueNotifier(true);
  final int _progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            OverscrollPop(
                dragToPopDirection: DragToPopDirection.vertical,
                enable: true,
                child: identical(widget.imageFile, null)
                    ? FutureBuilder(
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: SizedBox(
                                width: 100.w,
                                height: 100.h,
                                child: const CircularProgressIndicator(),
                              ),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.data != null) {
                              getTemporaryDirectory().then((value) {
                                // Get the image name
                                final imageName =
                                    widget.arg.imageUrl.split('/').last;

                                // Create an image name
                                var filename = '${value.path}/$imageName';

                                // Save to filesystem
                                File file = File(filename);
                                file.writeAsBytes(snapshot.data!.bodyBytes);
                              });

                              return Column(
                                children: [
                                  Expanded(
                                    child: PhotoView.customChild(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: widget.arg.imageProvider,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      try {
                                        MediaHelper.downloadImage(
                                          widget.arg.imageUrl,
                                          response1: snapshot.data!,
                                        );
                                      } on PlatformException catch (error) {
                                        log(error.message.toString());
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.download_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              );
                            }
                            return Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                height: 60.h,
                                width: 0.5.sw,
                                color: context.exPrimaryColor,
                                child: Text('اعادة المحاولة'),
                              ).onTap(() {
                                setState(() {});
                              }),
                            );
                          } else {
                            return Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                height: 60.h,
                                width: 0.5.sw,
                                color: context.exPrimaryColor,
                                child: Text('اعادة المحاولة'),
                              ).onTap(() {
                                setState(() {});
                              }),
                            );
                          }
                        }

                        //     Column(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     // LinearProgressIndicator(
                        //     //   value: _progress / 100,
                        //     //   color: context.exPrimaryColor,
                        //     //   backgroundColor: Colors.grey,
                        //     // ),
                        //
                        //     // const SizedBox(),
                        //   ],
                        // )

                        ,
                        future: http.get(Uri.parse(widget.arg.imageUrl)),
                      )
                    : () {
                        // debugPrint("jlnasdas");

                        Image image = Image.file(
                          widget.imageFile!,
                        );
                        // debugPrint(image.height.toString());
                        // debugPrint(image.height.toString());
                        // debugPrint(image.width.toString());
                        // debugPrint(widget.imageFile!.existsSync().toString());

                        return Column(
                          // crossAxisAlignment: ,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: image),
                            IconButton(
                              onPressed: () async {
                                try {
                                  MediaHelper.downloadImage(
                                    widget.arg.imageUrl,
                                    outputMimeType:
                                        'image/${widget.arg.imageUrl.split('.').last}',
                                    imageFile: widget.imageFile,
                                  );
                                  // String? i = await ImageDownloader.downloadImage(
                                  //   widget.arg.imageUrl,
                                  //   outputMimeType:
                                  //       'image/${widget.arg.imageUrl.split('.').last}',
                                  // ).timeout(const Duration(seconds: 5));

                                  // if (i == null) {
                                  //   BotToast.showText(text: 'error!');
                                  //   return;
                                  // } else {
                                  //   BotToast.showText(
                                  //     text: 'Downloaded Successfully',
                                  //   );
                                  // }
                                } on PlatformException catch (error) {
                                  log(error.message.toString());
                                }
                              },
                              icon: const Icon(
                                Icons.download_rounded,
                                color: Colors.white,
                              ),
                            )
                          ],
                        );
                      }()),
          ],
        ),
      ),
    );
  }
}

class ImageViewScreenParams {
  final ImageProvider imageProvider;
  final String imageUrl;
  File? imageFile;
  final String? topRightCornerText;
  final String? topLeftCornerText;
  final String? bottomLeftCornerText;

  ImageViewScreenParams({
    this.imageFile,
    required this.imageProvider,
    required this.imageUrl,
    this.topRightCornerText,
    this.topLeftCornerText,
    this.bottomLeftCornerText,
  });
}

// class _Hidable extends StatelessWidget {
//   const _Hidable({
//     Key? key,
//     required this.value,
//     required this.child,
//   }) : super(key: key);
//
//   final bool value;
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSize(
//       duration: const Duration(milliseconds: 150),
//       curve: Curves.easeIn,
//       child: AnimatedSwitcher(
//         switchInCurve: Curves.easeIn,
//         switchOutCurve: Curves.easeIn,
//         duration: const Duration(milliseconds: 150),
//         child: value ? child : const SizedBox(),
//       ),
//     );
//   }
// }
