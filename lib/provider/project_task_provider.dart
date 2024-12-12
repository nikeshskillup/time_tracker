import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../models/time_entry.dart';  // Import the TimeEntry model

class TimeEntryProvider with ChangeNotifier {
  final LocalStorage storage = LocalStorage('time_entries');  // LocalStorage instance to store data
  List<TimeEntry> _entries = [];  // List to hold time entries

  // Getter to retrieve entries
  List<TimeEntry> get entries => _entries;

  // Load data from local storage when the app starts
  Future<void> loadEntries() async {
    await storage.ready;  // Wait for local storage to be ready
    final data = storage.getItem('entries');
    if (data != null) {
      _entries = List<TimeEntry>.from(data.map((e) => TimeEntry.fromMap(e)));
      notifyListeners();  // Notify listeners (UI) that the data has changed
    }
  }

  // Add a new time entry
  void addTimeEntry(TimeEntry entry) {
    _entries.add(entry);  // Add new entry to the list
    storage.setItem('entries', _entries.map((e) => e.toMap()).toList());  // Save updated list to local storage
    notifyListeners();  // Notify listeners to update UI
  }

  // Delete a time entry by ID
  void deleteTimeEntry(String id) {
    _entries.removeWhere((entry) => entry.id == id);  // Remove entry with the given ID
    storage.setItem('entries', _entries.map((e) => e.toMap()).toList());  // Save updated list to local storage
    notifyListeners();  // Notify listeners to update UI
  }
}
