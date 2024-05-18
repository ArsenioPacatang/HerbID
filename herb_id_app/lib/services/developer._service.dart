import '../model/developer.dart';

abstract interface class DeveloperService {
  Future<List<Developer>> developersList();
}
