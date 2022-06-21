import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/set_money_controller.dart';

class SliderComponentPercent extends StatefulWidget {
  final double min;
  final double max;
  final int divisions;
  const SliderComponentPercent({
    Key? key,
    required this.min,
    required this.max,
    required this.divisions,
  }) : super(key: key);

  @override
  State<SliderComponentPercent> createState() => _SliderComponentPercentState();
}

class _SliderComponentPercentState extends State<SliderComponentPercent> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SetMoneyController>();
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 5.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 32.0),
        tickMarkShape: const RoundSliderTickMarkShape(),
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      child: Slider(
        value: _currentSliderValue,
        min: widget.min,
        max: widget.max,
        divisions: widget.divisions,
        label: "${_currentSliderValue.round()}%",
        onChanged: (double values) {
          setState(() {
            _currentSliderValue = values;
            controller.selectedltvValue = values;
          });
        },
      ),
    );
  }
}
