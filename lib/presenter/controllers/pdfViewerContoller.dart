import 'package:get/get.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerController extends GetxController {
  var totalPages = 0.obs;
  var currentPage = 0.obs;
  var isReady = false.obs;
  late PDFViewController pdfViewController;

  void setTotalPages(int pages) {
    totalPages.value = pages;
    isReady.value = true;
  }

  void setPage(int page) {
    currentPage.value = page;
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pdfViewController.setPage(currentPage.value - 1);
    }
  }

  void nextPage() {
    if (currentPage.value < totalPages.value - 1) {
      pdfViewController.setPage(currentPage.value + 1);
    }
  }
}
