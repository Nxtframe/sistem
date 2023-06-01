import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/providers/employee_provider.dart';
import 'package:sistem/providers/oranganization_provider.dart';
import 'package:sistem/providers/profile_info.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sistem/widgets/app_bar_widget.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(employeeProvider).value;
    final organizationId = ref.watch(organizationIdProvider).value;
    final username = ref.watch(userInfo).value;

    return Scaffold(
      appBar: AppBarFragment(
        title: 'Profile',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Organization ID:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              organizationId ?? 'N/A',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Role:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              user?.employee_role ?? 'N/A',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Name:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              username ?? 'N/A',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            FutureBuilder<String?>(
              future: ref.watch(userInfoId.future),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                final userId = snapshot.data;
                if (userId != null) {
                  return FutureBuilder<GetUrlResult>(
                    future: Amplify.Storage.getUrl(key: userId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      final imageUrl = snapshot.data;
                      if (imageUrl != null) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  imageUrl.url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'User ID:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              userId,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('Image not found');
                      }
                    },
                  );
                } else {
                  return const Text('User ID not found');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
