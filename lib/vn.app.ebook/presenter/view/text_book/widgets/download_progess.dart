import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DownloadProgressDialog extends StatelessWidget {
  const DownloadProgressDialog({
    super.key,
    this.message = 'Downloading...',
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    const progressDownload = 0.2;
    return CircularPercentIndicator(
      radius: 30.dp,
      lineWidth: 5.dp,
      percent: progressDownload,
      center: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.download,
            color: Colours.success[500],
          ),
          Text(
            '${(progressDownload * 100).toStringAsFixed(0)}%',
            style: textSize12.copyWith(
              fontFamily: fontBold,
              color: Colours.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade300,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.blueAccent,
    );
  }
}
