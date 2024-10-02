
import 'package:flutter/material.dart';
import 'filter_expansion_tile.dart';
import 'filter_header.dart';
import 'filterchip_display.dart';

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<String> selectedFilters = [];
  String? selectedActivity;
  TextEditingController _locationController = TextEditingController();

  // Map to store filters and their corresponding icons
  final Map<String, Map<String, dynamic>> filterIconsAndColors = {
    'Today': {'icon': Icons.access_time_filled, 'color': Color.fromARGB(255, 207, 165, 18)},
    'Tomorrow': {'icon': Icons.access_time_filled, 'color': Color.fromARGB(255, 207, 165, 18)},
    // 'Location 1': {'icon': Icons.location_on, 'color': Colors.blue},
    // 'Location 2': {'icon': Icons.location_on, 'color': Colors.blue},
    'Location': {
      'icon': Icons.location_on,
      'color': Colors.blue
    },
    'Person 1': {'icon': Icons.person, 'color': Colors.green},
    'Person 2': {'icon': Icons.person, 'color': Colors.green},
    'Activity 1': {'icon': Icons.event, 'color': Colors.orange},
    'Activity 2': {'icon': Icons.event, 'color': Colors.orange},
    'Spot 1': {'icon': Icons.star, 'color': Colors.purple},
    'Spot 2': {'icon': Icons.star, 'color': Colors.purple},
  };

  void _toggleFilter(String filter) {
    setState(() {
      if (selectedFilters.contains(filter)) {
        selectedFilters.remove(filter);
      } else {
        selectedFilters.add(filter);
      }
    });
  }

  void _selectActivity(String activity) {
    setState(() {
      selectedActivity = activity;

      if (!selectedFilters.contains(activity)) {
        selectedFilters.removeWhere((filter) => filter.contains('Activity'));

        selectedFilters.add(activity);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.7,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        style: const TextStyle(fontSize: 14, height: 1),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 13, 117, 164),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                      ),
                      child: const Icon(Icons.search, size: 26),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Filter Header
                FilterHeader(),

                const SizedBox(height: 12),

                // Selected Filters
                FilterChipDisplay(
                  selectedFilters: selectedFilters,
                  filterIconsAndColors: filterIconsAndColors,
                  onFilterToggle: _toggleFilter,
                ),

                const SizedBox(height: 10),

                // Reset and Search Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 13, 117, 164),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text('Reset', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 13, 117, 164),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),

                      ),
                      child: const Text('Search'),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                const Divider(thickness: 2, height: 1),

                // Filter Expansion Tiles
                FilterExpansionTiles(
                  selectedFilters: selectedFilters,
                  onFilterToggle: _toggleFilter,
                  locationController: _locationController,
                  selectedActivity: selectedActivity,
                  onActivitySelect: _selectActivity,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

