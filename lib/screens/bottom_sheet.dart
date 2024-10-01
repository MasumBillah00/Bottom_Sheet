// import 'package:flutter/material.dart';
//
// class FilterBottomSheet extends StatefulWidget {
//   @override
//   _FilterBottomSheetState createState() => _FilterBottomSheetState();
// }
//
// class _FilterBottomSheetState extends State<FilterBottomSheet> {
//   List<String> selectedFilters = [];
//   String? selectedActivity;
//   TextEditingController _locationController = TextEditingController();
//
//   // Map to store filters and their corresponding icons
//   final Map<String, Map<String, dynamic>> filterIconsAndColors = {
//     'Today': {'icon': Icons.access_time_filled, 'color': Color.fromARGB(255, 207, 165, 18)},
//     'Tomorrow': {'icon': Icons.access_time_filled, 'color': Color.fromARGB(255, 207, 165, 18)},
//     'Location 1': {'icon': Icons.location_on, 'color': Colors.blue},
//     'Location 2': {'icon': Icons.location_on, 'color': Colors.blue},
//     'Person 1': {'icon': Icons.person, 'color': Colors.green},
//     'Person 2': {'icon': Icons.person, 'color': Colors.green},
//     'Activity 1': {'icon': Icons.event, 'color': Colors.orange},
//     'Activity 2': {'icon': Icons.event, 'color': Colors.orange},
//     'Spot 1': {'icon': Icons.star, 'color': Colors.purple},
//     'Spot 2': {'icon': Icons.star, 'color': Colors.purple},
//   };
//
//   // Toggle filter function to add/remove selected filters
//   void _toggleFilter(String filter) {
//     setState(() {
//       if (selectedFilters.contains(filter)) {
//         selectedFilters.remove(filter);
//       } else {
//         selectedFilters.add(filter);
//       }
//     });
//   }
//
//   // Function to handle activity selection
//   void _selectActivity(String activity) {
//     setState(() {
//       selectedActivity = activity;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       expand: false,
//       initialChildSize: 0.7,
//       minChildSize: 0.5,
//       maxChildSize: 0.8,
//       builder: (BuildContext context, ScrollController scrollController) {
//         return SingleChildScrollView(
//           controller: scrollController,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Search Bar
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Search',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(2.0),
//                           ),
//                         ),
//                         style: const TextStyle(fontSize: 14, height: 1),
//                         textAlignVertical: TextAlignVertical.center,
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 13, 117, 164),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(2.0),
//                         ),
//                         padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
//                       ),
//                       child: const Icon(Icons.search, size: 26),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//
//                 // Filter Header
//                 Container(
//                   width: double.infinity,
//                   height: 55,
//                   padding: const EdgeInsets.all(12.0),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 13, 117, 164),
//                     borderRadius: BorderRadius.circular(0.0),
//                   ),
//                   child: const Text(
//                     'Filter By',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//
//                 // Selected Filters Display
//                 Wrap(
//                   spacing: 8.0,
//                   runSpacing: 4.0,
//                   children: selectedFilters.map((filter) {
//                     return Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4.0),
//                       ),
//                       child: FilterChip(
//                         label: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(
//                               filterIconsAndColors[filter]!['icon'],
//                               color: filterIconsAndColors[filter]!['color'],
//                             ),
//                             const SizedBox(width: 8),
//                             Text(filter),
//                             const SizedBox(width: 8),
//                             IconButton(
//                               icon: const Icon(Icons.cancel_outlined, color: Colors.black54),
//                               onPressed: () {
//                                 _toggleFilter(filter);
//                               },
//                               padding: EdgeInsets.zero,
//                               constraints: const BoxConstraints(),
//                             ),
//                           ],
//                         ),
//                         onSelected: (bool selected) {
//                           _toggleFilter(filter);
//                         },
//                         backgroundColor: Colors.amber.shade100,
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(height: 10),
//
//                 // Reset and Search Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     OutlinedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue.shade700,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                       ),
//                       child: const Text('Reset', style: TextStyle(color: Colors.white)),
//                     ),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue.shade700,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                       ),
//                       child: const Text('Search'),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 const Divider(thickness: 2, height: 1),
//
//                 ExpansionTile(
//                   title: const Row(
//                     children: [
//                       Icon(Icons.access_time_filled, color: Color.fromARGB(255, 207, 165, 18)),
//                       SizedBox(width: 5), // Adjust the width to reduce the gap
//                       Text(
//                         'When',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//                   tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//                   children: <Widget>[
//                     ListTile(
//                       title: const Text('Today'),
//                       dense: true,
//                       onTap: () {
//                         _toggleFilter('Today');
//                       },
//                     ),
//                     ListTile(
//                       title: const Text('Tomorrow'),
//                       dense: true,
//                       onTap: () {
//                         _toggleFilter('Tomorrow');
//                       },
//                     ),
//                   ],
//                 ),
//
//                 const Divider(thickness: 2, height: 1),
//                 ExpansionTile(
//                   title: const Row(
//                     children: [
//                       Icon(Icons.location_on, color: Colors.blue),
//                       SizedBox(width: 5),
//                       Text(
//                         'Where',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//                   tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//                   children: <Widget>[
//                     // Input Field and Submit Button in Row
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Row(
//                         children: [
//                           // Expanded TextField to take up available space
//                           Expanded(
//                             child: TextField(
//                               controller: _locationController, // Define this controller in your state class
//                               decoration: InputDecoration(
//                                 labelText: 'Enter location',
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 8), // Spacing between TextField and Button
//
//                           // Submit Button
//                           ElevatedButton(
//                             onPressed: () {
//                               final location = _locationController.text.trim(); // Get the entered location
//                               if (location.isNotEmpty) {
//                                 _toggleFilter(location); // Add the entered location to the filters
//                                 _locationController.clear(); // Clear the input field
//                               }
//                             },
//                             child: Text('Submit'),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//
//
//                 const Divider(thickness: 2, height: 1),
//
//                 ExpansionTile(
//                   title: const Row(
//                     children: [
//                       Icon(Icons.person),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         'Who',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//                   tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//                   children: <Widget>[
//                     ListTile(
//                       title: const Text('Person 1'),
//                       dense: true,
//                       onTap: () {
//                         _toggleFilter('Person 1');
//                       },
//                     ),
//                     ListTile(
//                       title: const Text('Person 2'),
//                       dense: true,
//                       onTap: () {
//                         _toggleFilter('Person 2');
//                       },
//                     ),
//                   ],
//                 ),
//                 const Divider(thickness: 2, height: 1),
//
//                 // Activities with Radio Buttons
//                 ExpansionTile(
//                   title: Row(
//                     children: [
//                       Icon(Icons.event, color: Colors.redAccent.shade700),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       const Text(
//                         'Activities',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//                   tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//                   children: <Widget>[
//                     RadioListTile<String>(
//                       title: const Text('Activity 1'),
//                       value: 'Activity 1',
//                       groupValue: selectedActivity,
//                       onChanged: (String? value) {
//                         _selectActivity(value!);
//                         _toggleFilter(value);
//                       },
//                     ),
//                     RadioListTile<String>(
//                       title: const Text('Activity 2'),
//                       value: 'Activity 2',
//                       groupValue: selectedActivity,
//                       onChanged: (String? value) {
//                         _selectActivity(value!);
//                         _toggleFilter(value);
//                       },
//                     ),
//                   ],
//                 ),
//                 const Divider(thickness: 2, height: 1),
//
//                 // Open Spots with Checkboxes
//                 ExpansionTile(
//                   title: Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.greenAccent.shade700),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       const Text(
//                         'Open Spots',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//                   tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//                   children: <Widget>[
//                     CheckboxListTile(
//                       title: const Text('Spot 1'),
//                       value: selectedFilters.contains('Spot 1'),
//                       onChanged: (bool? value) {
//                         _toggleFilter('Spot 1');
//                       },
//                       controlAffinity: ListTileControlAffinity.leading,
//                     ),
//                     CheckboxListTile(
//                       title: const Text('Spot 2'),
//                       value: selectedFilters.contains('Spot 2'),
//                       onChanged: (bool? value) {
//                         _toggleFilter('Spot 2');
//                       },
//                       controlAffinity: ListTileControlAffinity.leading,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

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
    'Location 1': {'icon': Icons.location_on, 'color': Colors.blue},
    'Location 2': {'icon': Icons.location_on, 'color': Colors.blue},
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.8,
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
                    OutlinedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
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
                        backgroundColor: Colors.blue.shade700,
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

