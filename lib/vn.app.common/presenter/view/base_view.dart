import 'package:base_core/vn.base.cores/presenter/screen_common.dart';
import 'package:base_core/vn.base.cores/presenter/viewmodel/base/base_vm.dart' as vm;
import 'package:flutter/material.dart';

abstract class BaseScreen<T extends StatefulWidget, V extends BaseViewModel>
    extends ScreenCommonState {}

abstract class BaseViewModel extends vm.BaseViewModel {}