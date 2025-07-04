import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key, required this.onChange});

  final Function(int) onChange;
  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  int value =1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(onTap: () {
          if(value ==1)return;
          value--;
          setState(() {});
          widget.onChange;
        }, iconData: Icons.remove,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text("$value",style: TextStyle(fontSize: 18),),
        ),
        _buildIconButton(onTap: () {
          if(value ==8)return;
          value++;
          setState(() {

          });
          widget.onChange;
        }, iconData: Icons.add,),
      ],
    );
  }

  Widget _buildIconButton({required VoidCallback onTap, required IconData iconData}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(iconData,size: 18,color: Colors.white,),
        ),
    );
  }
}
