import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';

Widget loading(isShow) {
  return !isShow
      ? Container()
      : Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xBF000000),
          alignment: Alignment.center,
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.dp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.dp),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: const Color(0xFF155EEF),
                          strokeWidth: 2.dp,
                        ),
                        Gaps.hGap10,
                        Text(
                          'Vui lòng đợi...',
                          style: textSize18.copyWith(
                            color: const Color(0xFF155EEF),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
}
