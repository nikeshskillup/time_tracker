import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/time_entry_provider.dart';

class GroupedByProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TimeEntryProvider>(
      builder: (context, provider, child) {
        final projects = provider.entries
            .map((entry) => entry.projectId)
            .toSet()
            .toList();

        return ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final projectId = projects[index];
            final projectEntries = provider.getEntriesByProject(projectId);

            return ExpansionTile(
              title: Text(projectId),
              children: projectEntries.map((entry) {
                return ListTile(
                  title: Text('${entry.taskId} - ${entry.totalTime} hours'),
                  subtitle: Text('Notes: ${entry.notes}'),
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}
