import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<String> selectedFilters = [];
  String? selectedActivity; // Variable to store selected activity

  // Toggle filter function to add/remove selected filters
  void _toggleFilter(String filter) {
    setState(() {
      if (selectedFilters.contains(filter)) {
        selectedFilters.remove(filter);
      } else {
        selectedFilters.add(filter);
      }
    });
  }

  // Function to handle activity selection
  void _selectActivity(String activity) {
    setState(() {
      selectedActivity = activity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.only(top: 30,right: 16,left: 16,bottom: 16),
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
                        style: TextStyle(fontSize: 14, height: 1),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12.0),
                      ),
                      child: Icon(Icons.search, size: 26),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Filter Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Filter By',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),

                // Selected Filters Display
                Wrap(
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
                            Text(filter),
                            SizedBox(width: 8),
                            IconButton(
                              icon: Icon(Icons.cancel, color: Colors.red),
                              onPressed: () {
                                _toggleFilter(filter);
                              },
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ],
                        ),
                        onSelected: (bool selected) {
                          _toggleFilter(filter);
                        },
                        backgroundColor: Colors.amber.shade100,
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),

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
                      child: Text('Reset', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text('Search'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(thickness: 3, height: 1),

                // Expansion Tiles
                ExpansionTile(
                  leading: Icon(Icons.access_time_filled, color: Colors.yellow),
                  title: Text('When'),
                  childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                  tilePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  children: <Widget>[
                    ListTile(
                      title: Text('Today'),
                      dense: true,
                      onTap: () {
                        _toggleFilter('Today');
                      },
                    ),
                    ListTile(
                      title: Text('Tomorrow'),
                      dense: true,
                      onTap: () {
                        _toggleFilter('Tomorrow');
                      },
                    ),
                  ],
                ),
                Divider(thickness: 3, height: 1),

                ExpansionTile(
                  leading: Icon(Icons.location_on, color: Colors.blue),
                  title: Text('Where'),
                  childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                  tilePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  children: <Widget>[
                    ListTile(
                      title: Text('Location 1'),
                      dense: true,
                      onTap: () {
                        _toggleFilter('Location 1');
                      },
                    ),
                    ListTile(
                      title: Text('Location 2'),
                      dense: true,
                      onTap: () {
                        _toggleFilter('Location 2');
                      },
                    ),
                  ],
                ),
                Divider(thickness: 3, height: 1),

                ExpansionTile(
                  leading: Icon(Icons.person),
                  title: Text('Who'),
                  childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                  tilePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  children: <Widget>[
                    ListTile(
                      title: Text('Person 1'),
                      dense: true,
                      onTap: () {
                        _toggleFilter('Person 1');
                      },
                    ),
                    ListTile(
                      title: Text('Person 2'),
                      dense: true,
                      onTap: () {
                        _toggleFilter('Person 2');
                      },
                    ),
                  ],
                ),
                Divider(thickness: 3, height: 1),

                // Activities with Radio Buttons
                ExpansionTile(
                  leading: Icon(Icons.event, color: Colors.redAccent.shade700),
                  title: Text('Activities'),
                  childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                  tilePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  children: <Widget>[
                    RadioListTile<String>(
                      title: Text('Activity 1'),
                      value: 'Activity 1',
                      groupValue: selectedActivity,
                      onChanged: (String? value) {
                        _selectActivity(value!);
                        _toggleFilter(value);
                      },
                    ),
                    RadioListTile<String>(
                      title: Text('Activity 2'),
                      value: 'Activity 2',
                      groupValue: selectedActivity,
                      onChanged: (String? value) {
                        _selectActivity(value!);
                        _toggleFilter(value);
                      },
                    ),
                  ],
                ),
                Divider(thickness: 3, height: 1),

                // Open Spots with Checkboxes
                ExpansionTile(
                  leading: Icon(Icons.star, color: Colors.greenAccent.shade700),
                  title: Text('Open Spots'),
                  childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                  tilePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  children: <Widget>[
                    CheckboxListTile(
                      title: Text('Spot 1'),
                      value: selectedFilters.contains('Spot 1'),
                      onChanged: (bool? value) {
                        _toggleFilter('Spot 1');
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    CheckboxListTile(
                      title: Text('Spot 2'),
                      value: selectedFilters.contains('Spot 2'),
                      onChanged: (bool? value) {
                        _toggleFilter('Spot 2');
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
