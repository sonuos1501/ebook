import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:base_core/vn.base.cores/res/widgets/blink_item.dart';
import 'package:base_core/vn.base.cores/res/widgets/load_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../model/books.dart';

class ItemBook extends StatelessWidget {
  const ItemBook({
    super.key,
    required this.book,
    required this.onPress,
    this.onPressDownload,
  });

  final Book book;
  final AsyncCallback onPress;
  final AsyncCallback? onPressDownload;

  @override
  Widget build(BuildContext context) {
    final isLink =
        book.link.contains('https://') || book.link.contains('http://');
    return BlinkItem(
      callback: (v) async {
        if (isLink && onPressDownload != null) {
          await onPressDownload!.call();
        } else {
          await onPress.call();
        }
      },
      child: SizedBox(
        width: 75.dp,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.dp),
                      child: LoadImage(book.image, fit: BoxFit.fill),
                    ),
                  ),
                  if (isLink)
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colours.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.dp),
                        ),
                        child: const Icon(
                          Icons.download,
                          color: Colours.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Gaps.vGap6,
            if (book.currentPage != null && book.maxPage != null)
              _linearProgressIndicator(),
            Text(
              book.name,
              textAlign: TextAlign.center,
              style: textSize10.copyWith(
                fontFamily: fontBold,
                color: Colours.greyLight[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _linearProgressIndicator() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            value: book.currentPage! / book.maxPage!,
          ),
        ),
        Gaps.vGap5,
      ],
    );
  }
}
