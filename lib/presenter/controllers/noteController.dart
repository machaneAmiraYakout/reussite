import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteController extends GetxController {
  var notes = <String, String>{}.obs; // Observable map for notes with "year_index" as the key

  // Load the saved notes from SharedPreferences when the controller is initialized
  @override
  void onInit() {
    super.onInit();
    loadNotes(); // Load all saved notes when the controller is created
  }

  // Save a note for a specific year and question index to SharedPreferences
  Future<void> saveNote(String year, int questionIndex, String note) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = 'note_${year}_$questionIndex';
    notes[key] = note;
    await prefs.setString(key, note);
  }

  // Load all notes from SharedPreferences
  Future<void> loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getKeys().forEach((key) {
      if (key.startsWith('note_')) {
        String yearIndex = key.substring(5); // Skip "note_"
        notes[yearIndex] = prefs.getString(key) ?? '';
      }
    });
  }

  // Delete a note for a specific year and question index from SharedPreferences
  Future<void> deleteNote(String year, int questionIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = 'note_${year}_$questionIndex';
    await prefs.remove(key);
    notes.remove(key);
  }
}
