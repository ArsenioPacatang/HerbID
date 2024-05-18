import 'package:flutter_test/flutter_test.dart';
import 'package:HerdID/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PlantListViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
