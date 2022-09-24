import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final refreshHomeProvider = ChangeNotifierProvider<RefreshHomePage>((ref) {
  return RefreshHomePage();
});

class RefreshHomePage extends ChangeNotifier {
  bool isLoading = false;

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // void refreshPage() {
  //   isLoading = true;
  //   notifyListeners();
  //   isLoading = false;
  // }
}
