import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:base_core/vn.base.cores/res/widgets/load_image.dart';
import 'package:ebook/r.dart';
import 'package:flutter/material.dart';
import '../../../widgets/title_appbar.dart';

class AppBarTextBook extends StatelessWidget {
  const AppBarTextBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _title(context),
              _content(context),
            ],
          ),
        ),
        _icon(),
      ],
    );
  }

  Widget _icon() => LoadImage(R.textBookbookKnowledge, height: 90.dp);

  Text _content(BuildContext context) => Text(
        'Bộ sách chân trời sáng tạo',
        style: textSize15.copyWith(
          fontFamily: fontRegular,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      );

  Widget _title(BuildContext context) {
    return const TitleAppBarBig(title: 'Sách giáo khoa');
  }
}
