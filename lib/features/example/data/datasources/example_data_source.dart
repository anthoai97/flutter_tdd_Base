import 'package:awesome_app/core/network/api_service.dart';
import 'package:awesome_app/core/network/base_response.dart';
import 'package:awesome_app/features/example/data/models/example_m.dart';
import 'package:awesome_app/features/example/domain/entities/example.dart';

abstract class ExampleRemoteDataSource {
  Future<ApiResponse<List<Example>>> getExample();
}

class ExampleRemoteDataSourceImpl extends ExampleRemoteDataSource {
  final ApiService apiService;
  ExampleRemoteDataSourceImpl({required this.apiService});

  @override
  Future<ApiResponse<List<Example>>> getExample() async {
    final url = 'https://612d0dbfab461c00178b6036.mockapi.io/users';

    final apiResponse = await apiService.get<List<ExampleModel>, ExampleModel>(
      url,
      baseObject: ExampleModel(),
    );

    return apiResponse;
  }
}
