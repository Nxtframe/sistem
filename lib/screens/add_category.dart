import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/create_category.dart';

class AddCategory extends ConsumerStatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCategoryState();
}

class _AddCategoryState extends ConsumerState<AddCategory> {
  final _categoryNameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _categoryNameController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _categoryNameController,
              decoration: const InputDecoration(
                labelText: 'Category Name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Handle form submission here
                final categoryName = _categoryNameController.text;
                setState(() {
                  isLoading = true;
                });
                await addCategory(categoryName, ref)
                    .then((value) => Navigator.pop(context));
              },
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
