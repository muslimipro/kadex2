import 'package:flutter/material.dart';

class PortfolioModel extends ChangeNotifier {
  String indexName;
  int get indexNumber => getNumber(indexName);

  PortfolioModel({this.indexName});

  void changeIndex(String newIndexName) {
    indexName = newIndexName;
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
