import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/providers/employee_provider.dart';
import 'package:sistem/widgets/app_bar_widget.dart';

class WorkersList extends ConsumerWidget {
  const WorkersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workers = ref.watch(employeeListProvider).value ?? [];
    print(ref.watch(employeeListProvider).value);

    void deleteEmployee() {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('Confirm Deletion'),
            content:
                const Text('Are you sure you want to delete this employee?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Perform the deletion logic here
                  // ref.read(employeeListProvider).deleteEmployee(worker.id);
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('Delete'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBarFragment(
        title: 'Employees list',
      ),
      body: ListView.builder(
        itemCount: workers.length,
        itemBuilder: (context, index) {
          final worker = workers[index];

          return ListTile(
            title: Text(worker.employee_email ?? ""),
            subtitle: Text(worker.employee_role ?? ""),
            trailing: worker.employee_role == 'manager'
                ? IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteEmployee();
                    },
                  )
                : null,
          );
        },
      ),
    );
  }
}
