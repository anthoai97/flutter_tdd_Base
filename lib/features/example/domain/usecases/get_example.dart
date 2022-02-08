import 'package:awesome_app/core/base_object.dart';
import 'package:awesome_app/core/network/base_response.dart';
import 'package:awesome_app/features/example/domain/entities/example.dart';
import 'package:awesome_app/features/example/domain/repostories/r_example.dart';

class GetExample extends Usecase<List<Example>, NoParam> {
  final ExampleRepository repository;

  GetExample({required this.repository});

  @override
  Future<ApiResponse<List<Example>>> call(NoParam params) {
    return repository.getUserExample();
  }
}
