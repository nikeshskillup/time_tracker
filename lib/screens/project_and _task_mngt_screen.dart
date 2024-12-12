import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/project.dart';
import 'models/task.dart';
import 'providers/project_task_provider.dart';

class ProjectTaskManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Projects and Tasks'),
      ),
      body: Consumer<ProjectTaskProvider>(
        builder: (context, provider, child) {
          return ListView(
            children: <Widget>[
              ListTile(
                title: Text('Projects'),
                onTap: () {
                  // Navigate to the screen to manage projects
                },
              ),
              ListTile(
                title: Text('Tasks'),
                onTap: () {
                  // Navigate to the screen to manage tasks
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open a screen to add new project or task
        },
        child: Icon(Icons.add),
        tooltip: 'Add Project/Task',
      ),
    );
  }
}
