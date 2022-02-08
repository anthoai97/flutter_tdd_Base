import 'package:awesome_app/core/network/base_response.dart';
import 'package:awesome_app/features/example/domain/entities/example.dart';

abstract class ExampleRepository {
  Future<ApiResponse<List<Example>>> getUserExample();
}
