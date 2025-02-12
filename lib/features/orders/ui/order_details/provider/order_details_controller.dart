import 'package:flutter/material.dart';

import '../../../../../shared/models/tab_menu.dart';

class OrderDetailsController extends ChangeNotifier {
  OrderDetailsController() {
    onTabsChanged(detailTabs.first);
  }

  final detailTabs = [
    TabMenu(id: 1, label: 'order.details.status.label', isSelected: true),
    TabMenu(id: 2, label: 'order.details.products.label', isSelected: false)
  ];

  dynamic activeTabId = 1;

  void onTabsChanged(TabMenu menu) {
    activeTabId = menu.id;
    notifyListeners();
  }
}
