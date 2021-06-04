import 'package:flutter/material.dart';

class PortfolioModel extends ChangeNotifier {
  String indexName;
  bool activated;
  bool recalculate = false;
  bool activateLoading = false;
  bool recalculateLoading = false;
  int get indexNumber => getNumber(indexName);

  PortfolioModel({this.indexName, this.activated});

  void changeIndex(String newIndexName) {
    indexName = newIndexName;
    notifyListeners();
  }

  void changeActivate() {
    activated = !activated;
    activateLoading = false;
    notifyListeners();
  }

  void changeActivateLoading(bool state) {
    activateLoading = state;
    notifyListeners();
  }

  void changeRecalculate() {
    recalculate = !recalculate;
    recalculateLoading = false;
    notifyListeners();
  }

  void changeRecalculateLoading(bool state) {
    recalculateLoading = state;
    notifyListeners();
  }

  int getNumber(String indexName) {
    switch (indexName) {
      case "i30":
        return 0;
        break;
      case "i50":
        return 1;
        break;
      case "i100":
        return 2;
        break;
      case "iCustom":
        return 3;
        break;
      default:
        return 0;
        break;
    }
  }
}
