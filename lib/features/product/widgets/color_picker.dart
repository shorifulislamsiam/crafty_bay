import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.colors,
    required this.onSelected,
  });

  final List<String> colors;
  final Function(String) onSelected;
  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String color in widget.colors)
          GestureDetector(
            onTap: (){
              _selectedColor = color;
              setState(() {

              });
              widget.onSelected(_selectedColor!);
            },
            child: Container(
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _selectedColor == color ? AppColors.themeColor: null,
                  border: Border.all(color: Colors.grey)),
              child: Text(color),
            ),
          ),
      ],
    );
  }
}
