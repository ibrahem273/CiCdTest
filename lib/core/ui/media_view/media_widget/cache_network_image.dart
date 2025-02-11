import 'dart:async';
import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pos_app/core/ui/media_view/media_screens/image_view_screen.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';

class CustomCachedNetworkImage extends StatefulWidget {
  const CustomCachedNetworkImage({
    super.key,
    this.hash,
    required this.url,
    required this.width,
    required this.height,
    this.color = Colors.blue,
    this.hashFit = BoxFit.fill,
    this.imageFit = BoxFit.contain,
    this.border,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.isPush = false,
    this.topRightCornerText,
    this.topLeftCornerText,
    this.mediaUrl,
    this.controller,
    this.cacheKey,
    this.bottomLeftCornerText,
  });

  final String? hash;
  final Color color;
  final String url;
  final BoxFit imageFit;
  final BoxFit hashFit;
  final double width;
  final double height;
  final Border? border;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final bool isPush;
  final StreamController<bool>? controller;
  final String? topRightCornerText;
  final String? topLeftCornerText;
  final String? bottomLeftCornerText;
  final String? mediaUrl, cacheKey;

  @override
  State<CustomCachedNetworkImage> createState() =>
      Custom_CachedNetworkImageState();
}

class Custom_CachedNetworkImageState extends State<CustomCachedNetworkImage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget.url,
      fit: widget.imageFit,
      cache: true,
      retries: 20,
      width: widget.width,
      height: widget.height,
      cacheKey: widget.cacheKey,
      // timeLimit: Duration(seconds: 10),
      // timeRetry: const Duration(seconds: 4),
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                shape: widget.shape,
                border: widget.border,
                borderRadius: widget.borderRadius,
              ),
              child: ClipRRect(
                borderRadius: (widget.borderRadius != null)
                    ? widget.borderRadius!.resolve(Directionality.of(context)) -
                        BorderRadius.circular(2)
                    : widget.shape == BoxShape.circle
                        ? BorderRadius.circular(100)
                        : BorderRadius.circular(15 - 2),
                child:

                    // != 'o'
                    widget.hash != null
                        ? BlurHash(
                            hash: widget.hash!,
                            imageFit: widget.hashFit,
                          )
                        : Shimmer.fromColors(
                            baseColor: context.exPrimaryContainer,
                            highlightColor: context.exPrimaryColor,
                            child: Container(
                              color: Colors.white,
                              width: widget.width,
                              height: widget.height,
                            ),
                          ),
              ),
            );

          case LoadState.failed:
            return GestureDetector(
              onTap: () => state.reLoadImage(),
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  shape: widget.shape,
                  border: widget.border,
                  borderRadius: widget.borderRadius,
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: (widget.borderRadius != null)
                          ? widget.borderRadius!
                                  .resolve(Directionality.of(context)) -
                              BorderRadius.circular(2)
                          : widget.shape == BoxShape.circle
                              ? BorderRadius.circular(100)
                              : BorderRadius.circular(15 - 2),
                      child: widget.hash == null
                          ? Container()
                          : BlurHash(hash: widget.hash!),
                    ),
                    const Center(
                      child: Icon(
                        Icons.replay_circle_filled_sharp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          case LoadState.completed:
            if (widget.controller != null) {
              widget.controller!.add(true);
            }

            return GestureDetector(
              onTap: widget.isPush
                  ? () async {
                      final dir = await getTemporaryDirectory();

                      // Get the image name
                      final imageName = widget.url.split('/').last;

                      // Create an image name
                      var filename = '${dir.path}/$imageName';

                      // Save to filesystem
                      final file = File(filename);
                      if (file.existsSync()) {
                        debugPrint("fileExist${file.path}");

                        openMedia(state, imageFile: file);
                      } else {
                        openMedia(state);
                      }
                    }
                  : null,
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: widget.width.w,
                height: widget.height.h,
                decoration: BoxDecoration(
                  shape: widget.shape,
                  // border: widget.border,
                  borderRadius: widget.borderRadius,
                  image: DecorationImage(
                    image: state.imageProvider,
                    fit: widget.imageFit,
                  ),
                ),
              ),
            ).animate().fadeIn(duration: const Duration(milliseconds: 700));
          default:
            return GestureDetector(
              onTap: () => state.reLoadImage(),
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  shape: widget.shape,
                  border: widget.border,
                  borderRadius: widget.borderRadius,
                  color: widget.color.withOpacity(.8),
                ),
                child: const Icon(
                  Icons.replay_circle_filled_sharp,
                  color: Colors.white,
                ),
              ),
            );
        }
      },
    );
  }

  void openMedia(ExtendedImageState state, {File? imageFile}) async {
    openImage(state.imageProvider, file: imageFile);
  }

  void openImage(ImageProvider imageProvider, {File? file}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ImageViewScreen(
          imageFile: file,
          arg: ImageViewScreenParams(
            imageProvider: imageProvider,
            imageUrl: widget.url,
            bottomLeftCornerText: widget.bottomLeftCornerText,
            topLeftCornerText: widget.topLeftCornerText,
            topRightCornerText: widget.topRightCornerText,
          ));
    }));
  }
}
