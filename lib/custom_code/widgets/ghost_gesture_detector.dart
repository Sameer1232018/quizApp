// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

class GhostGestureDetector extends StatefulWidget {
  const GhostGestureDetector({
    Key? key,
    this.width,
    this.height,
    this.timeoutSeconds = 30,
    this.actionOnDetected,
    this.actionOnTimeout,
    this.actionOnDispose,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int timeoutSeconds;
  final Future Function()? actionOnDetected;
  final Future Function()? actionOnTimeout;
  final Future Function()? actionOnDispose;

  @override
  State<GhostGestureDetector> createState() => _GhostGestureDetectorState();
}

class _GhostGestureDetectorState extends State<GhostGestureDetector> {
  Timer? _timer;
  bool _isTimedOut = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
    //print('GhostGestureDetector initialized');
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.actionOnDispose?.call();
    //print('GhostGestureDetector disposed');
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: widget.timeoutSeconds), () {
      //print('Timeout occurred.');
      _isTimedOut = true;
      widget.actionOnTimeout?.call();
    });
  }

  void _handleGesture() {
    //print('Gesture detected.');
    if (_isTimedOut) {
      //print('Screen was timed out. Reactivating...');
      _isTimedOut = false;
    }
    widget.actionOnDetected?.call();
    _startTimer(); // Reset the timer on any gesture
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => _handleGesture(),
      onPointerMove: (_) => _handleGesture(),
      onPointerHover: (_) => _handleGesture(),
      child: IgnorePointer(
        child: Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? double.infinity,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
