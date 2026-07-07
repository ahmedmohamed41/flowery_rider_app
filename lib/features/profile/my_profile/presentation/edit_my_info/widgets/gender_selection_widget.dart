import 'package:flutter/material.dart';

class GenderSelectionWidget extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String> onChanged;

  const GenderSelectionWidget({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Gender',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        Radio<String>(
          value: 'female',
          groupValue: selectedGender.toLowerCase(),
          onChanged: (value) => onChanged(value!),
        ),
        const Text('Female'),
        const SizedBox(width: 16),
        Radio<String>(
          value: 'male',
          groupValue: selectedGender.toLowerCase(),
          onChanged: (value) => onChanged(value!),
        ),
        const Text('Male'),
      ],
    );
  }
}