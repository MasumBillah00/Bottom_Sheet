// import 'package:flutter/material.dart';
//
// class FilterExpansionTiles extends StatefulWidget {
//   final List<String> selectedFilters;
//   final Function(String) onFilterToggle;
//   final TextEditingController locationController;
//   final String? selectedActivity;
//   final Function(String) onActivitySelect;
//
//   const FilterExpansionTiles({
//     super.key,
//     required this.selectedFilters,
//     required this.onFilterToggle,
//     required this.locationController,
//     required this.selectedActivity,
//     required this.onActivitySelect,
//   });
//
//   @override
//   _FilterExpansionTilesState createState() => _FilterExpansionTilesState();
// }
//
// class _FilterExpansionTilesState extends State<FilterExpansionTiles> {
//   // Track checkbox states for "Spot" section
//   bool isSpot1Checked = false;
//   bool isSpot2Checked = false;
//
//   // FocusNode to track the focus state of the "Where" text field
//   FocusNode locationFocusNode = FocusNode();
//   bool isLocationFocused = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Listen to changes in focus state
//     locationFocusNode.addListener(() {
//       setState(() {
//         isLocationFocused = locationFocusNode.hasFocus;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     // Dispose the focus node when the widget is disposed
//     locationFocusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // "When" ExpansionTile
//           ExpansionTile(
//             title: const Row(
//               children: [
//                 Icon(Icons.access_time_filled, color: Color.fromARGB(255, 207, 165, 18)),
//                 SizedBox(width: 5),
//                 Text('When', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//               ],
//             ),
//             childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//             tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//             children: [
//               ListTile(
//                 title: const Text('Today'),
//                 dense: true,
//                 onTap: () {
//                   widget.onFilterToggle('Today');
//                 },
//               ),
//               ListTile(
//                 title: const Text('Tomorrow'),
//                 dense: true,
//                 onTap: () {
//                   widget.onFilterToggle('Tomorrow');
//                 },
//               ),
//             ],
//           ),
//           const Divider(thickness: 2, height: 1),
//
//           // "Where" ExpansionTile with input field and submit button
//           ExpansionTile(
//             title: const Row(
//               children: [
//                 Icon(Icons.location_on, color: Colors.blue),
//                 SizedBox(width: 5),
//                 Text('Where', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//               ],
//             ),
//             childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//             tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//             children: [
//               ListTile(
//                 title: TextField(
//                   controller: widget.locationController,
//                   focusNode: locationFocusNode, // Attach the focus node here
//                   decoration: const InputDecoration(
//                     labelText: 'Enter location',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 title: ElevatedButton(
//                   onPressed: () {
//                     if (widget.locationController.text.isNotEmpty) {
//                       widget.onFilterToggle('location: ${widget.locationController.text}');
//                       widget.locationController.clear();
//                     }
//                   },
//                   child: const Text(
//                     'Submit',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Divider(thickness: 2, height: 1),
//
//           // "Who" ExpansionTile
//           ExpansionTile(
//             title: const Row(
//               children: [
//                 Icon(Icons.person, color: Colors.green),
//                 SizedBox(width: 5),
//                 Text('Who', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//               ],
//             ),
//             childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//             tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//             children: [
//               ListTile(
//                 title: const Text('Person 1'),
//                 dense: true,
//                 onTap: () {
//                   widget.onFilterToggle('Person 1');
//                 },
//               ),
//               ListTile(
//                 title: const Text('Person 2'),
//                 dense: true,
//                 onTap: () {
//                   widget.onFilterToggle('Person 2');
//                 },
//               ),
//             ],
//           ),
//           const Divider(thickness: 2, height: 1),
//
//           // "Activities" ExpansionTile
//           ExpansionTile(
//             title: const Row(
//               children: [
//                 Icon(Icons.event, color: Colors.orange),
//                 SizedBox(width: 5),
//                 Text('Activities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//               ],
//             ),
//             childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//             tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//             children: [
//               RadioListTile<String>(
//                 title: const Text('Activity 1'),
//                 value: 'Activity 1',
//                 groupValue: widget.selectedActivity,
//                 onChanged: (String? value) {
//                   setState(() {
//                     widget.onActivitySelect(value!);
//                   });
//                 },
//               ),
//               RadioListTile<String>(
//                 title: const Text('Activity 2'),
//                 value: 'Activity 2',
//                 groupValue: widget.selectedActivity,
//                 onChanged: (String? value) {
//                   setState(() {
//                     widget.onActivitySelect(value!);
//                   });
//                 },
//               ),
//             ],
//           ),
//           const Divider(thickness: 2, height: 1),
//
//           // "Spot" ExpansionTile with checkboxes
//           ExpansionTile(
//             title: Row(
//               children: [
//                 Icon(Icons.star_outlined, color: Colors.purple),
//                 const SizedBox(width: 5),
//                 const Text('Spot', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//               ],
//             ),
//             childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//             tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//             children: [
//               CheckboxListTile(
//                 title: const Text('Spot 1'),
//                 value: isSpot1Checked,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     isSpot1Checked = value ?? false;
//                     widget.onFilterToggle('Spot 1');
//                   });
//                 },
//                 controlAffinity: ListTileControlAffinity.leading,  // Checkbox icon on the left
//               ),
//               CheckboxListTile(
//                 title: const Text('Spot 2'),
//                 value: isSpot2Checked,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     isSpot2Checked = value ?? false;
//                     widget.onFilterToggle('Spot 2');
//                   });
//                 },
//                 controlAffinity: ListTileControlAffinity.leading,  // Checkbox icon on the left
//               ),
//             ],
//           ),
//
//           // Conditionally render SizedBox based on the focus state of the input field
//           if (isLocationFocused) const SizedBox(height: 1200),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FilterExpansionTiles extends StatefulWidget {
  final List<String> selectedFilters;
  final Function(String) onFilterToggle;
  final TextEditingController locationController;
  final String? selectedActivity;
  final Function(String) onActivitySelect;

  const FilterExpansionTiles({
    super.key,
    required this.selectedFilters,
    required this.onFilterToggle,
    required this.locationController,
    required this.selectedActivity,
    required this.onActivitySelect,
  });

  @override
  _FilterExpansionTilesState createState() => _FilterExpansionTilesState();
}

class _FilterExpansionTilesState extends State<FilterExpansionTiles> {
  bool isSpot1Checked = false;
  bool isSpot2Checked = false;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: bottomInset), // Add padding when keyboard is open
        child: Column(
          children: [
            // "When" ExpansionTile
            ExpansionTile(
              title: const Row(
                children: [
                  Icon(Icons.access_time_filled, color: Color.fromARGB(255, 207, 165, 18)),
                  SizedBox(width: 5),
                  Text('When', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
              tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              children: [
                ListTile(
                  title: const Text('Today'),
                  dense: true,
                  onTap: () {
                    widget.onFilterToggle('Today');
                  },
                ),
                ListTile(
                  title: const Text('Tomorrow'),
                  dense: true,
                  onTap: () {
                    widget.onFilterToggle('Tomorrow');
                  },
                ),
              ],
            ),
            const Divider(thickness: 2, height: 1),

            // "Where" ExpansionTile with input field and submit button
            ExpansionTile(
              title: const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 5),
                  Text('Where', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
              tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              children: [
                ListTile(
                  title: TextField(
                    controller: widget.locationController,
                    decoration: const InputDecoration(
                      labelText: 'Enter location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ListTile(
                  title: ElevatedButton(
                    onPressed: () {
                      if (widget.locationController.text.isNotEmpty) {
                        widget.onFilterToggle('location: ${widget.locationController.text}');
                        widget.locationController.clear();
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 2, height: 1),

            // "Who" ExpansionTile
            ExpansionTile(
              title: const Row(
                children: [
                  Icon(Icons.person, color: Colors.green),
                  SizedBox(width: 5),
                  Text('Who', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
              tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              children: [
                ListTile(
                  title: const Text('Person 1'),
                  dense: true,
                  onTap: () {
                    widget.onFilterToggle('Person 1');
                  },
                ),
                ListTile(
                  title: const Text('Person 2'),
                  dense: true,
                  onTap: () {
                    widget.onFilterToggle('Person 2');
                  },
                ),
              ],
            ),
            const Divider(thickness: 2, height: 1),

            // "Activities" ExpansionTile
            ExpansionTile(
              title: const Row(
                children: [
                  Icon(Icons.event, color: Colors.orange),
                  SizedBox(width: 5),
                  Text('Activities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
              tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              children: [
                RadioListTile<String>(
                  title: const Text('Activity 1'),
                  value: 'Activity 1',
                  groupValue: widget.selectedActivity,
                  onChanged: (String? value) {
                    setState(() {
                      widget.onActivitySelect(value!);
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Activity 2'),
                  value: 'Activity 2',
                  groupValue: widget.selectedActivity,
                  onChanged: (String? value) {
                    setState(() {
                      widget.onActivitySelect(value!);
                    });
                  },
                ),
              ],
            ),
            const Divider(thickness: 2, height: 1),

            // "Spot" ExpansionTile with checkboxes
            ExpansionTile(
              title: Row(
                children: [
                  Icon(Icons.star_outlined, color: Colors.purple),
                  const SizedBox(width: 5),
                  const Text('Spot', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
              tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              children: [
                CheckboxListTile(
                  title: const Text('Spot 1'),
                  value: isSpot1Checked,
                  onChanged: (bool? value) {
                    setState(() {
                      isSpot1Checked = value ?? false;
                      widget.onFilterToggle('Spot 1');
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  // Checkbox icon on the left
                ),
                CheckboxListTile(
                  title: const Text('Spot 2'),
                  value: isSpot2Checked,
                  onChanged: (bool? value) {
                    setState(() {
                      isSpot2Checked = value ?? false;
                      widget.onFilterToggle('Spot 2');
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  // Checkbox icon on the left
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class FilterExpansionTiles extends StatefulWidget {
//   final List<String> selectedFilters;
//   final Function(String) onFilterToggle;
//   final TextEditingController locationController;
//   final String? selectedActivity;
//   final Function(String) onActivitySelect;
//
//   const FilterExpansionTiles({
//     super.key,
//     required this.selectedFilters,
//     required this.onFilterToggle,
//     required this.locationController,
//     required this.selectedActivity,
//     required this.onActivitySelect,
//   });
//
//   @override
//   _FilterExpansionTilesState createState() => _FilterExpansionTilesState();
// }
//
// class _FilterExpansionTilesState extends State<FilterExpansionTiles> {
//   // Track checkbox states for "Spot" section
//   bool isSpot1Checked = false;
//   bool isSpot2Checked = false;
//
//   // FocusNode to track the focus state of the "Where" text field
//   FocusNode locationFocusNode = FocusNode();
//   bool isLocationFocused = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Listen to changes in focus state
//     locationFocusNode.addListener(() {
//       setState(() {
//         isLocationFocused = locationFocusNode.hasFocus;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     // Dispose the focus node when the widget is disposed
//     locationFocusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Unfocus the text field when tapping outside
//         FocusScope.of(context).unfocus();
//       },
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             // "When" ExpansionTile
//             ExpansionTile(
//               title: const Row(
//                 children: [
//                   Icon(Icons.access_time_filled, color: Color.fromARGB(255, 207, 165, 18)),
//                   SizedBox(width: 5),
//                   Text('When', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//                 ],
//               ),
//               childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//               tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               children: [
//                 ListTile(
//                   title: const Text('Today'),
//                   dense: true,
//                   onTap: () {
//                     widget.onFilterToggle('Today');
//                   },
//                 ),
//                 ListTile(
//                   title: const Text('Tomorrow'),
//                   dense: true,
//                   onTap: () {
//                     widget.onFilterToggle('Tomorrow');
//                   },
//                 ),
//               ],
//             ),
//             const Divider(thickness: 2, height: 1),
//
//             // "Where" ExpansionTile with input field and submit button
//             ExpansionTile(
//               title: const Row(
//                 children: [
//                   Icon(Icons.location_on, color: Colors.blue),
//                   SizedBox(width: 5),
//                   Text('Where', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//                 ],
//               ),
//               childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//               tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               children: [
//                 ListTile(
//                   title: TextField(
//                     controller: widget.locationController,
//                     focusNode: locationFocusNode, // Attach the focus node here
//                     decoration: const InputDecoration(
//                       labelText: 'Enter location',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   title: ElevatedButton(
//                     onPressed: () {
//                       if (widget.locationController.text.isNotEmpty) {
//                         widget.onFilterToggle('location: ${widget.locationController.text}');
//                         widget.locationController.clear();
//                       }
//                     },
//                     child: const Text(
//                       'Submit',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const Divider(thickness: 2, height: 1),
//
//             // "Who" ExpansionTile
//             ExpansionTile(
//               title: const Row(
//                 children: [
//                   Icon(Icons.person, color: Colors.green),
//                   SizedBox(width: 5),
//                   Text('Who', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//                 ],
//               ),
//               childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//               tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               children: [
//                 ListTile(
//                   title: const Text('Person 1'),
//                   dense: true,
//                   onTap: () {
//                     widget.onFilterToggle('Person 1');
//                   },
//                 ),
//                 ListTile(
//                   title: const Text('Person 2'),
//                   dense: true,
//                   onTap: () {
//                     widget.onFilterToggle('Person 2');
//                   },
//                 ),
//               ],
//             ),
//             const Divider(thickness: 2, height: 1),
//
//             // "Activities" ExpansionTile
//             ExpansionTile(
//               title: const Row(
//                 children: [
//                   Icon(Icons.event, color: Colors.orange),
//                   SizedBox(width: 5),
//                   Text('Activities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//                 ],
//               ),
//               childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//               tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               children: [
//                 RadioListTile<String>(
//                   title: const Text('Activity 1'),
//                   value: 'Activity 1',
//                   groupValue: widget.selectedActivity,
//                   onChanged: (String? value) {
//                     setState(() {
//                       widget.onActivitySelect(value!);
//                     });
//                   },
//                 ),
//                 RadioListTile<String>(
//                   title: const Text('Activity 2'),
//                   value: 'Activity 2',
//                   groupValue: widget.selectedActivity,
//                   onChanged: (String? value) {
//                     setState(() {
//                       widget.onActivitySelect(value!);
//                     });
//                   },
//                 ),
//               ],
//             ),
//             const Divider(thickness: 2, height: 1),
//
//             // "Spot" ExpansionTile with checkboxes
//             ExpansionTile(
//               title: Row(
//                 children: [
//                   Icon(Icons.star_outlined, color: Colors.purple),
//                   const SizedBox(width: 5),
//                   const Text('Spot', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//                 ],
//               ),
//               childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
//               tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               children: [
//                 CheckboxListTile(
//                   title: const Text('Spot 1'),
//                   value: isSpot1Checked,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       isSpot1Checked = value ?? false;
//                       widget.onFilterToggle('Spot 1');
//                     });
//                   },
//                   controlAffinity: ListTileControlAffinity.leading,  // Checkbox icon on the left
//                 ),
//                 CheckboxListTile(
//                   title: const Text('Spot 2'),
//                   value: isSpot2Checked,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       isSpot2Checked = value ?? false;
//                       widget.onFilterToggle('Spot 2');
//                     });
//                   },
//                   controlAffinity: ListTileControlAffinity.leading,  // Checkbox icon on the left
//                 ),
//               ],
//             ),
//
//             // Conditionally render SizedBox based on the focus state of the input field
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 300),  // More reasonable duration
//               height: isLocationFocused ? 300 : 0,  // Adjust the height here
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
