import 'package:base_core/vn.base.cores/utils/src/storages/storages_helper_implementions.dart';
import 'package:ebook/routers.dart';
import 'package:ebook/vn.app.common/presenter/model/bottom_bar_model.dart';
import 'package:ebook/vn.app.common/presenter/view/base_view.dart';
import 'package:ebook/vn.app.ebook/presenter/view/ebook_host/ebook_host_screen.dart';
import 'package:ebook/vn.app.ebook/presenter/view/ebook_host/ebook_host_vm.dart';
import 'package:ebook/vn.app.ebook/presenter/view/library/library.dart';
import 'package:ebook/vn.app.ebook/presenter/view/text_book/text_book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../r.dart';

class EbookHostState extends StatefulWidget {
  const EbookHostState({super.key});

  @override
  EbookHost createState() => EbookHost();
}

class EbookHost extends BaseScreen<EbookHostState, EbookHostViewModel> {
  late List<BottomBarItemModel> listTab;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  void initViewModel() {
    Get.lazyPut(() => EbookHostViewModel());
  }

  @override
  void initState() {
    super.initState();
    vm.currentUser =
        StoragesHelperImpl.instance.childrenEntity ?? Get.arguments;
    _initTabBarData();
    final param = Get.parameters;
    vm.selectedIndex = _getTabIndex(param['screenName']);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.loaded();
    });
  }

  @override
  Widget initWidget(BuildContext context, double topHeight) {
    return EbookHostScreen(this, context).screen();
  }

  int _getTabIndex(String? screen) {
    final index =
        listTab.firstWhereOrNull((element) => element.id == screen)?.index;
    return index ?? 0;
  }

  void _initTabBarData() {
    listTab = [
      BottomBarItemModel(
        0,
        Routers.textBook,
        'Sách giáo khoa',
        R.tabbarIcHome,
        R.tabbarIcHomeSelected,
        TextBookState(currentUser: vm.currentUser),
      ),
      BottomBarItemModel(
        1,
        Routers.library,
        'Thư viện',
        R.tabbarIcReport,
        R.tabbarIcReportSelected,
        LibraryState(currentUser: vm.currentUser),
      ),
    ];
    listTab.sort((a, b) => a.index.compareTo(b.index));
  }

  void onItemSelected(int index) {
    vm.selectedIndex = index;
    vm.update();
  }

  Widget getCurrentPage() {
    return PageStorage(bucket: _bucket, child: listTab[vm.selectedIndex].child);
  }
}
