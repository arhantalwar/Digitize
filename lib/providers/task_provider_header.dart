import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskProvider with ChangeNotifier {
  bool notEmpty(TextEditingController Headcontroller,
      TextEditingController Descriptioncontroller) {
    if (Headcontroller.text != "" && Descriptioncontroller.text != "") {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }
}
