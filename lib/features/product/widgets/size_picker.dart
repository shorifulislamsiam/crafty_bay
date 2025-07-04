import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onSelected});

  final List<String> size;
  final Function(String) onSelected;
  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String size in widget.size)
          GestureDetector(
            onTap: () {
              _selectedSize = size;
              setState(() {});
              widget.onSelected(_selectedSize!);
            },
            child: Container(
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _selectedSize == size ? AppColors.themeColor : null,
                border: Border.all(color: Colors.grey),
              ),
              child: Text(size),
            ),
          ),
      ],
    );
  }
}
