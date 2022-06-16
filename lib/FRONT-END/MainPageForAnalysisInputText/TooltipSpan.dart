import 'package:flutter/material.dart';

class TooltipSpan extends WidgetSpan {
  TooltipSpan({
    required String message,
    required InlineSpan inlineSpan,
  }) : super(
          child: SingleChildScrollView(
            child: Tooltip(
              message: message,
              child: Text.rich(
                inlineSpan,
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(0),
              showDuration: Duration(seconds: 0),
              decoration: BoxDecoration(
                color: Color(0xFF49454F).withOpacity(0.9),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              textStyle: TextStyle(color: Color(0xFFFBFDF7)),
              preferBelow: false,
              verticalOffset: 20,
            ),
          ),
        );
}
