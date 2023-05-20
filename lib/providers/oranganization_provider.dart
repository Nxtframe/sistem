import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/helpers/query_orgId_from_email.dart';
import 'package:sistem/helpers/query_organisation_name.dart';

import '../models/Organization.dart';

Future<String?> _fetchOrganizationId() async {
  final organizations = await queryOrgansationIdFromEmail();

  return organizations;
}

final organizationIdProvider = FutureProvider<String?>((ref) async {
  final orgName = await _fetchOrganizationId();
  return orgName;
});

final organization = FutureProvider<Organization?>((ref) async {
  final orgid = await _fetchOrganizationId();
  final orgName = await queryOrganization(orgid!);
  return orgName;
});
