import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  final List<String> sizes; // Using String for size values
  final Function(String) onSizeSelected; // Return the selected size as a String

  const SizePicker({
    super.key,
    required this.sizes,
    required this.onSizeSelected,
  });

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  late String _selectedSize = widget.sizes.first; // Initializing with the first size

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 8,
          children: widget.sizes.map((item) {
            return GestureDetector(
              onTap: () {
                _selectedSize = item; // Update selected size
                widget.onSizeSelected(item); // Callback when size is selected
                setState(() {}); // Update UI
              },
              child: CircleAvatar(
                backgroundColor: _selectedSize == item
                    ? AppColors.themeColor // Highlight selected size
                    : Colors.grey, // Default color for non-selected
                child: Text(
                  item,
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontWeight: _selectedSize == item
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
