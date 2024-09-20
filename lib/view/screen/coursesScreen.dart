import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/loadPdfFromAssets.dart';
import '../widget/colors.dart';
import 'pdfViewerScreen.dart'; // Import your PdfViewerScreen

class CoursesScreen extends StatelessWidget {
  final List<String> courses; // List of PDF file paths

  const CoursesScreen({Key? key, required this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        leading:IconButton(
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
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          // Extract PDF file name for display
          String pdfTitle = courses[index].split('/').last;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: o, // Set color with opacity
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            child: // Inside your CoursesScreen
            ListTile(
              title: Text(pdfTitle),
              onTap: () async {
                // Load the PDF from assets and get the temporary file path
                String tempPdfPath = await loadPdfFromAssets(courses[index]);

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
    );
  }
}
