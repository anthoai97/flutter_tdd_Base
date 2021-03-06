// Mocks generated by Mockito 5.1.0 from annotations
// in awesome_app/test/features/example/data/datasources/example_data_source_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:awesome_app/core/base_object.dart' as _i5;
import 'package:awesome_app/core/network/api_service.dart' as _i3;
import 'package:awesome_app/core/network/base_response.dart' as _i2;
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

class _FakeApiResponse_0<T> extends _i1.Fake implements _i2.ApiResponse<T> {}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i3.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ApiResponse<T>> get<T, K>(String? url,
          {_i5.BaseObject? baseObject, Map<String, String>? params}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #get, [url], {#baseObject: baseObject, #params: params}),
              returnValue:
                  Future<_i2.ApiResponse<T>>.value(_FakeApiResponse_0<T>()))
          as _i4.Future<_i2.ApiResponse<T>>);
  @override
  _i4.Future<_i2.ApiResponse<T>> put<T, K>(String? url,
          {_i5.BaseObject? baseObject,
          dynamic body,
          Map<String, dynamic>? params}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#baseObject: baseObject, #body: body, #params: params}),
              returnValue:
                  Future<_i2.ApiResponse<T>>.value(_FakeApiResponse_0<T>()))
          as _i4.Future<_i2.ApiResponse<T>>);
  @override
  _i4.Future<_i2.ApiResponse<T>> post<T, K>(String? url,
          {_i5.BaseObject? baseObject,
          dynamic body,
          Map<String, dynamic>? params}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#baseObject: baseObject, #body: body, #params: params}),
              returnValue:
                  Future<_i2.ApiResponse<T>>.value(_FakeApiResponse_0<T>()))
          as _i4.Future<_i2.ApiResponse<T>>);
  @override
  _i4.Future<_i2.ApiResponse<T>> delete<T, K>(String? url,
          {_i5.BaseObject? baseObject, Map<String, dynamic>? params}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #delete, [url], {#baseObject: baseObject, #params: params}),
              returnValue:
                  Future<_i2.ApiResponse<T>>.value(_FakeApiResponse_0<T>()))
          as _i4.Future<_i2.ApiResponse<T>>);
}
