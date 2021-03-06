// Mocks generated by Mockito 5.1.0 from annotations
// in awesome_app/test/features/example/presentation/bloc/example_page_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:awesome_app/core/base_object.dart' as _i7;
import 'package:awesome_app/core/network/base_response.dart' as _i3;
import 'package:awesome_app/features/example/domain/entities/example.dart'
    as _i6;
import 'package:awesome_app/features/example/domain/repostories/example_r.dart'
    as _i2;
import 'package:awesome_app/features/example/domain/usecases/get_example.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeExampleRepository_0 extends _i1.Fake
    implements _i2.ExampleRepository {}

class _FakeApiResponse_1<T> extends _i1.Fake implements _i3.ApiResponse<T> {}

/// A class which mocks [GetExample].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetExample extends _i1.Mock implements _i4.GetExample {
  MockGetExample() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ExampleRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeExampleRepository_0()) as _i2.ExampleRepository);
  @override
  _i5.Future<_i3.ApiResponse<List<_i6.Example>>> call(_i7.NoParam? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i3.ApiResponse<List<_i6.Example>>>.value(
                  _FakeApiResponse_1<List<_i6.Example>>()))
          as _i5.Future<_i3.ApiResponse<List<_i6.Example>>>);
}
