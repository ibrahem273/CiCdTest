import 'package:flutter/material.dart';
import 'package:pos_app/core/enums/response_status.dart';
import 'package:pos_app/core/ui/widget/error_widget.dart';
import 'package:pos_app/core/ui/widget/reponsive_loader_widget.dart';

class TrackStateCustomWidget extends StatefulWidget {
  final ResponseStatus status;
  final Widget successWidget;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final VoidCallback? onError;
  const TrackStateCustomWidget(
      {required this.status,
      required this.successWidget,
      this.onError,
      this.errorWidget,
      this.loadingWidget,
      super.key});
  @override
  TrackStateCustomWidgetState createState() => TrackStateCustomWidgetState();
}

class TrackStateCustomWidgetState extends State<TrackStateCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return () {
      if (widget.status == ResponseStatus.loading) {
        return widget.loadingWidget ?? ResponsiveLoaderWidget();
      } else if (widget.status == ResponseStatus.success) {
        return widget.successWidget;
      } else if (widget.status == ResponseStatus.init) {
        return SizedBox.shrink();
      } else {
        return widget.errorWidget ?? MainErrorWidget(onTap: widget.onError!);
      }
    }();
  }
}
