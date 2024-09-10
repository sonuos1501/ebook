import 'package:ebook/routers.dart';
import 'package:ebook/vn.app.common/presenter/view/base_view.dart';
import 'package:ebook/vn.app.ebook/presenter/view/select_account/select_account_screen.dart';
import 'package:ebook/vn.app.ebook/presenter/view/select_account/select_account_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAccountState extends StatefulWidget {
  const SelectAccountState({super.key});

  @override
  SelectAccount createState() => SelectAccount();
}

class SelectAccount
    extends BaseScreen<SelectAccountState, SelectAccountViewModel> {
  @override
  void initViewModel() {
    Get.lazyPut(() => SelectAccountViewModel());
  }

  @override
  Widget initWidget(BuildContext context, double topHeight) {
    return SelectAccountScreen(this, context).screen();
  }

  void onAccountSelected(String id) {
    final selectedUserIndex = vm.users.indexWhere((e) => e.id == id);
    final user = vm.currentUser(selectedUserIndex);
    Get.toNamed(Routers.ebookHost, arguments: user);
  }
}
