import 'package:flutter/material.dart';

class FilterExpansionTiles extends StatelessWidget {
  final List<String> selectedFilters;
  final Function(String) onFilterToggle;
  final TextEditingController locationController;
  final String? selectedActivity;
  final Function(String) onActivitySelect;

  const FilterExpansionTiles({
    required this.selectedFilters,
    required this.onFilterToggle,
    required this.locationController,
    required this.selectedActivity,
    required this.onActivitySelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // When ExpansionTile
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
                onFilterToggle('Today');
              },
            ),
            ListTile(
              title: const Text('Tomorrow'),
              dense: true,
              onTap: () {
                onFilterToggle('Tomorrow');
              },
            ),
          ],
        ),
        const Divider(thickness: 2, height: 1),

        // Where ExpansionTile
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
                controller: locationController,
    decoration: InputDecoration(
                                labelText: 'Enter location',
                                border: OutlineInputBorder(),
                              ),
              ),
            ),
            ListTile(
              title: const Text('Location 1'),
              dense: true,
              onTap: () {
                onFilterToggle('Location 1');
              },
            ),
            ListTile(
              title: const Text('Location 2'),
              dense: true,
              onTap: () {
                onFilterToggle('Location 2');
              },
            ),
          ],
        ),
        const Divider(thickness: 2, height: 1),

        // Who ExpansionTile
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
                onFilterToggle('Person 1');
              },
            ),
            ListTile(
              title: const Text('Person 2'),
              dense: true,
              onTap: () {
                onFilterToggle('Person 2');
              },
            ),
          ],
        ),
        const Divider(thickness: 2, height: 1),

        // Activities ExpansionTile
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
            ListTile(
              title: const Text('Activity 1'),
              dense: true,
              onTap: () {
                onActivitySelect('Activity 1');
              },
            ),
            ListTile(
              title: const Text('Activity 2'),
              dense: true,
              onTap: () {
                onActivitySelect('Activity 2');
              },
            ),
          ],
        ),
      ],
    );
  }
}
