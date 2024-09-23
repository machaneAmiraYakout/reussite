import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/loadPdfFromAssets.dart';
import '../widget/colors.dart';
import 'pdfViewerScreen.dart'; // Import your PdfViewerScreen

class CoursesScreen extends StatefulWidget {
  final Map<String, List<String>> coursesByYear; // Map of years to courses

  const CoursesScreen({Key? key, required this.coursesByYear}) : super(key: key);

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  String? selectedYear; // To keep track of the selected year

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_circle_left,
            color: pricipalColor, // Use light mode color
            size: 40,
          ),
        ),
      ),
      body: Column(
        children: [
          // Dropdown for selecting year
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.cyan, // Background color
                borderRadius: BorderRadius.circular(30.0), // Rounded corners
              ),
              child: DropdownButton<String>(
                value: selectedYear,
                hint: const Text(
                  'Select Year',
                  style: TextStyle(color: Colors.white), // Text color
                ),
                dropdownColor: Colors.grey.withOpacity(0.4), // Dropdown background color
                items: widget.coursesByYear.keys.map((String year) {
                  return DropdownMenuItem<String>(
                    value: year,
                    child: Text(
                      year,
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedYear = newValue;
                  });
                },
                isExpanded: true, // Makes the dropdown expand to fill the width
                underline: SizedBox(), // Removes the underline
              ),
            )

          ),
          // List of courses based on selected year
          Expanded(
            child: ListView.builder(
              itemCount: selectedYear != null ? widget.coursesByYear[selectedYear]!.length : 0,
              itemBuilder: (context, index) {
                String course = widget.coursesByYear[selectedYear]![index];
                // Extract PDF file name for display
                String pdfTitle = course.split('/').last;

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: o, // Set color with opacity
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  child: ListTile(
                    title: Text(pdfTitle),
                    onTap: () async {
                      // Load the PDF from assets and get the temporary file path
                      String tempPdfPath = await loadPdfFromAssets(course);

                      // Check if the path is valid before navigating
                      if (tempPdfPath.isNotEmpty) {
                        // Pass both the PDF path and course title
                        Get.to(() => PdfViewerScreen(pdfPath: tempPdfPath, courseTitle: pdfTitle));
                      } else {
                        print("Failed to load PDF");
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
