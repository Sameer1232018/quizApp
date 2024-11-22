import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'daily_test_page_widget.dart' show DailyTestPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class DailyTestPageModel extends FlutterFlowModel<DailyTestPageWidget> {
  ///  Local state fields for this page.

  int quizScore = 0;

  bool? isCorrect;

  String? selectedAns = '';

  bool quizOver = true;

  bool nextSelected = false;

  int? coins;

  int? questNum = 1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 45000;
  int timerMilliseconds = 45000;
  String timerValue = StopWatchTimer.getDisplayTime(
    45000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [AdMob - Show Interstitial Ad] action in Timer widget.
  bool? interstitialAdSuccess1;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  AudioPlayer? soundPlayer1;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Submit widget.
  bool? interstitialAdSuccess;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
