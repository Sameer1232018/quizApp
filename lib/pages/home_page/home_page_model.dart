import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String currentQuest = 'NA';

  String currentAnswer = 'NA';

  List<String> currentIncorrect = [];
  void addToCurrentIncorrect(String item) => currentIncorrect.add(item);
  void removeFromCurrentIncorrect(String item) => currentIncorrect.remove(item);
  void removeAtIndexFromCurrentIncorrect(int index) =>
      currentIncorrect.removeAt(index);
  void insertAtIndexInCurrentIncorrect(int index, String item) =>
      currentIncorrect.insert(index, item);
  void updateCurrentIncorrectAtIndex(int index, Function(String) updateFn) =>
      currentIncorrect[index] = updateFn(currentIncorrect[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
