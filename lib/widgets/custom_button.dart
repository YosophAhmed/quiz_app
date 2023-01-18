import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double width;
  final double height;
  final bool isLoading;
  final Color color;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.width = double.infinity,
    this.height = 3.0,
    this.isLoading = false,
    this.color = Colors.red,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          // color: AppCubit.get(context).isSelected ? Colors.amberAccent : color,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
