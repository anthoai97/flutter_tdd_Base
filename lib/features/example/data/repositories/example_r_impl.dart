import 'package:awesome_app/core/network/base_response.dart';
import 'package:awesome_app/features/example/data/datasources/example_data_source.dart';
import 'package:awesome_app/features/example/domain/entities/example.dart';
import 'package:awesome_app/features/example/domain/repostories/example_r.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  final ExampleRemoteDataSource remoteDataSource;

  ExampleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResponse<List<Example>>> getUserExample() async {
    return await remoteDataSource.getExample();
  }
}
