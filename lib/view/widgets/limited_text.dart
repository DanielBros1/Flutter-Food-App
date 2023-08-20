import 'package:flutter/material.dart';

class LimitedText extends StatefulWidget {
  final String text;
  final int maxLength;

  const LimitedText({super.key, required this.text, required this.maxLength});

  @override
  State<LimitedText> createState() => _LimitedTextState();
}

class _LimitedTextState extends State<LimitedText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _isExpanded
            ? Text(widget.text)
        // Cut the part of the text
            : Text(
          // We should check this condition, else method .substring can return RangeError
            widget.text.length <= widget.maxLength
                ? widget.text
                : widget.text.substring(0, widget.maxLength) + '...'),
        // If text is longer than maxLength => user can expand it
        if (widget.text.length > widget.maxLength)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'Show less' : 'Show more',
              style: TextStyle(
                color: Colors.indigo.shade200,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
