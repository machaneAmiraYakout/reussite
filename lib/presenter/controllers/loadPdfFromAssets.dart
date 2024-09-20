import 'dart:io';
import 'package:flutter/services.dart'; // For loading assets
import 'package:path_provider/path_provider.dart'; // For accessing temp directory

// Function to copy the PDF file from assets to the temp directory
Future<String> loadPdfFromAssets(String assetPath) async {
  try {
    // Load PDF file from assets as byte data
    ByteData data = await rootBundle.load(assetPath);

    // Get the system's temporary directory
    Directory tempDir = await getTemporaryDirectory();

    // Create a temporary file in the temp directory with a unique name
    File tempFile = File('${tempDir.path}/temp_pdf_${DateTime.now().millisecondsSinceEpoch}.pdf');

    // Write the PDF byte data into the temp file
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);

    // Return the path of the temporary file
    return tempFile.path;
  } catch (e) {
    print("Error loading PDF from assets: $e");
    return '';
  }
}
