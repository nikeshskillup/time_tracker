import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/time_entry_provider.dart';

class TimeEntryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timeEntries = Provider.of<TimeEntryProvider>(context).timeEntries;

    return Scaffold(
      appBar: AppBar(
        title: Text("Time Entries"),
      ),
      body: ListView.builder(
        itemCount: timeEntries.length,
        itemBuilder: (context, index) {
          final entry = timeEntries[index];
          return ListTile(
            title: Text("${entry.project} - ${entry.task}"),
            subtitle: Text("${entry.timeSpent} hours on ${entry.date.toLocal()}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<TimeEntryProvider>(context, listen: false)
                    .deleteTimeEntry(entry.id);
              },
            ),
          );
        },
      ),
    );
  }
}
