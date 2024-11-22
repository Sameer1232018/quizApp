import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'slider_model.dart';
export 'slider_model.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
    this.parameter1,
  });

  final int? parameter1;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late SliderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SliderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Slider(
        activeColor: const Color(0xFF105DFB),
        inactiveColor: const Color(0xFFE0E3E7),
        min: 0.0,
        max: 100.0,
        value: _model.sliderValue ??= widget.parameter1!.toDouble(),
        onChanged: (newValue) {
          newValue = double.parse(newValue.toStringAsFixed(4));
          safeSetState(() => _model.sliderValue = newValue);
        },
      ),
    );
  }
}
