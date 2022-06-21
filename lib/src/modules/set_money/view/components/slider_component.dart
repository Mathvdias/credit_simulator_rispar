import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/set_money_controller.dart';

class SliderComponent extends StatefulWidget {
  final double min;
  final double max;
  final int divisions;
  const SliderComponent({
    Key? key,
    required this.min,
    required this.max,
    required this.divisions,
  }) : super(key: key);

  @override
  State<SliderComponent> createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  double _currentSliderValue = 3;
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
        label: _currentSliderValue.round().toString(),
        onChanged: (values) {
          setState(() {
            _currentSliderValue = values;
            controller.selectedTermValue = values;
          });
        },
      ),
    );
  }
}
