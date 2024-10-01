import 'package:flutter/material.dart';

class FilterChipDisplay extends StatelessWidget {
  final List<String> selectedFilters;
  final Map<String, Map<String, dynamic>> filterIconsAndColors;
  final Function(String) onFilterToggle;

  const FilterChipDisplay({
    required this.selectedFilters,
    required this.filterIconsAndColors,
    required this.onFilterToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: selectedFilters.map((filter) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: FilterChip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  filterIconsAndColors[filter]!['icon'],
                  color: filterIconsAndColors[filter]!['color'],
                ),
                const SizedBox(width: 8),
                Text(filter),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.cancel_outlined, color: Colors.black54),
                  onPressed: () {
                    onFilterToggle(filter);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            onSelected: (bool selected) {
              onFilterToggle(filter);
            },
            backgroundColor: Colors.amber.shade100,
          ),
        );
      }).toList(),
    );
  }
}
