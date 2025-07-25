// Mocks generated by Mockito 5.4.6 from annotations
// in nubank_mobile_test/test/src/data/services/url_shortener_api_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:nubank_mobile_test/src/config/http/client/client.dart' as _i3;
import 'package:nubank_mobile_test/src/config/http/client/client_request.dart'
    as _i5;
import 'package:nubank_mobile_test/src/config/http/client/client_response.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClientResponse_0 extends _i1.SmartFake
    implements _i2.ClientResponse {
  _FakeClientResponse_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i3.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ClientResponse> post(_i5.ClientRequest? request) =>
      (super.noSuchMethod(
            Invocation.method(#post, [request]),
            returnValue: _i4.Future<_i2.ClientResponse>.value(
              _FakeClientResponse_0(this, Invocation.method(#post, [request])),
            ),
          )
          as _i4.Future<_i2.ClientResponse>);

  @override
  _i4.Future<_i2.ClientResponse> get(_i5.ClientRequest? request) =>
      (super.noSuchMethod(
            Invocation.method(#get, [request]),
            returnValue: _i4.Future<_i2.ClientResponse>.value(
              _FakeClientResponse_0(this, Invocation.method(#get, [request])),
            ),
          )
          as _i4.Future<_i2.ClientResponse>);
}
