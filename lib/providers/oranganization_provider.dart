import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/query_orgId_from_email.dart';

Future<String?> _fetchOrganizationId() async {
  final organizations = await queryOrgansationIdFromEmail();

  return organizations;
}

final organizationIdProvider = FutureProvider<String?>((ref) async {
  final orgName = await _fetchOrganizationId();
  return orgName;
});
