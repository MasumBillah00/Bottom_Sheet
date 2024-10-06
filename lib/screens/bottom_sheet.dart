import 'package:flutter/material.dart';
import 'filter_expansion_tile.dart';
import 'filter_header.dart';
import 'filterchip_display.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<String> selectedFilters = [];
  String? selectedActivity;
  TextEditingController _locationController = TextEditingController();

  // Map to store filters and their corresponding icons
  final Map<String, Map<String, dynamic>> filterIconsAndColors = {
    'Today': {'icon': Icons.access_time_filled, 'color': const Color.fromARGB(255, 207, 165, 18)},
    'Tomorrow': {'icon': Icons.access_time_filled, 'color': const Color.fromARGB(255, 207, 165, 18)},
    'Location': {'icon': Icons.location_on, 'color': Colors.blue},
    'Person 1': {'icon': Icons.person_search_rounded, 'color': Colors.black87},
    'Person 2': {'icon': Icons.person_search_rounded, 'color': Colors.black87},
    'Activity 1': {'icon': Icons.event_note_outlined, 'color': const Color.fromARGB(255,134, 99, 42)},
    'Activity 2': {'icon': Icons.event_note_outlined, 'color': const Color.fromARGB(255,134, 99, 42)},
    'Spot 1': {'icon': Icons.local_activity_rounded, 'color':const Color.fromARGB(255,76, 175, 80)},
    'Spot 2': {'icon': Icons.local_activity_rounded, 'color': const Color.fromARGB(255,76, 175, 80)},
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
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.7,
        builder: (BuildContext context, ScrollController scrollController) {
          return Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            thickness: 12,
            //trackVisibility: true,

            radius: const Radius.circular(20),
            child: SingleChildScrollView(
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
                          onPressed:(){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 13, 117, 164),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          ),
                          child: const Icon(Icons.search, size: 28),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Filter Header
                    const Header(),

                    const SizedBox(height: 12),

                    // Selected Filters
                    KeyWordDisplay(
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
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          ),
                          child: const Text('Search'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    const Divider(thickness: 2, height: 1),

                    // Filter Expansion Tiles
                    ExpansionTiles(
                      selectedFilters: selectedFilters,
                      onFilterToggle: _toggleFilter,
                      locationController: _locationController,
                      selectedActivity: selectedActivity,
                      onActivitySelect: _selectActivity,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
