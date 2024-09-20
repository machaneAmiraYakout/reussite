import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/pdfViewerContoller.dart';

class PdfViewerScreen extends StatelessWidget {
  final String pdfPath;
  final String courseTitle;

  const PdfViewerScreen({super.key, required this.pdfPath, required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    final PdfViewerController pdfController = Get.put(PdfViewerController());

    return Scaffold(
      appBar: AppBar(
        title: Text(courseTitle),
        actions: [
          Obx(() => pdfController.totalPages.value > 0
              ? Row(
            children: [
              Center(
                child: Text(
                  '${pdfController.currentPage.value + 1}/${pdfController.totalPages.value}', // Display page as 1-based index
                ),
              ),
              IconButton(
                icon: const Icon(Icons.navigate_before),
                onPressed: pdfController.previousPage,
              ),
              IconButton(
                icon: const Icon(Icons.navigate_next),
                onPressed: pdfController.nextPage,
              ),
            ],
          )
              : Container()),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: pdfPath,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: false,
            onRender: (pages) {
              pdfController.setTotalPages(pages!);
            },
            onViewCreated: (PDFViewController vc) {
              pdfController.pdfViewController = vc;
            },
            onPageChanged: (page, total) {
              pdfController.setPage(page!);
            },
            onError: (error) {
              print(error.toString());
            },
            onPageError: (page, error) {
              print('$page: ${error.toString()}');
            },
          ),
          Obx(() => !pdfController.isReady.value
              ? const Center(child: CircularProgressIndicator())
              : Container()),
        ],
      ),
    );
  }
}
