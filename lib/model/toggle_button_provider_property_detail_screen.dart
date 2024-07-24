import 'package:flutter/material.dart';

class ToggleButtonProvider with ChangeNotifier{
  List<bool> isSelected = [true,false,false,false];
  int selectedIndex = 0;

  void updateIndex(int index){
    for(int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++){
      isSelected[buttonIndex] = (buttonIndex == index);
    }
    selectedIndex = index;
    notifyListeners();
  }
}