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
          );
        },
      ),
    );
  }
}
