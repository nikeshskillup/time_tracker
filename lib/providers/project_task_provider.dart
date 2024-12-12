import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../models/project.dart';
import '../models/task.dart';

class ProjectTaskProvider with ChangeNotifier {
  List<Project> _projects = [];
  List<Task> _tasks = [];
  final LocalStorage storage = LocalStorage('time_tracker_projects_tasks');

  List<Project> get projects => _projects;
  List<Task> get tasks => _tasks;

  ProjectTaskProvider() {
    loadProjectsAndTasks();
  }

  // Load projects and tasks from local storage
  Future<void> loadProjectsAndTasks() async {
    await storage.ready;
    final data = storage.getItem('projects');
    if (data != null) {
      _projects = (data['projects'] as List)
          .map((project) => Project(id: project['id'], name: project['name']))
          .toList();
      _tasks = (data['tasks'] as List)
          .map((task) => Task(id: task['id'], name: task['name']))
          .toList();
      notifyListeners();
    }
  }

  // Add a new project
  void addProject(Project project) {
    _projects.add(project);
    storage.setItem('projects', _projects.map((p) => {'id': p.id, 'name': p.name}).toList());
    notifyListeners();
  }

  // Add a new task
  void addTask(Task task) {
    _tasks.add(task);
    storage.setItem('tasks', _tasks.map((t) => {'id': t.id, 'name': t.name}).toList());
    notifyListeners();
  }
}
