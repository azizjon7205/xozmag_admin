import 'package:flutter/material.dart';

import '/shared/models/tab_menu.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = false;

  DateTime? toDate;
  DateTime? fromDate;

  GlobalKey scaffoldKey = GlobalKey();

  final detailTabs = [
    TabMenu(id: 1, label: 'base.day', isSelected: true),
    TabMenu(id: 2, label: 'base.month', isSelected: false),
    TabMenu(id: 3, label: 'base.year', isSelected: false)
  ];

  dynamic activeTabId = 1;

  void onTabsChanged(TabMenu menu) {
    activeTabId = menu.id;
    notifyListeners();
  }
}