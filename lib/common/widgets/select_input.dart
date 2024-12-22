import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AGSelectInput extends StatefulWidget {
  const AGSelectInput({
    required this.items,
    required this.onChanged,
    required this.value,
    super.key,
  });

  final List<String> items;
  final String value;
  final void Function(String?)? onChanged;

  @override
  State<AGSelectInput> createState() => _AGSelectInputState();
}

class _AGSelectInputState extends State<AGSelectInput> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
      ),
      child: DropdownButton<String>(
        underline: const SizedBox.shrink(),
        value: widget.value,
        icon: const Icon(
          Icons.arrow_drop_down,
        ),
        style: TextStyle(
          fontSize: 16.0.sp,
        ),
        onChanged: widget.onChanged,
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.0.sp,
                color: const Color(0xFF252529)
              ),
            ),
          );
        }).toList(),
        dropdownColor: Colors.white,
        iconDisabledColor:
            Colors.grey,
        elevation: 8,
      ),
    );
  }
}
