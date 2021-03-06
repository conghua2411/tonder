// Mocks generated by Mockito 5.1.0 from annotations
// in tonder/test/repo/partner_repo_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:tonder/model/partner.dart' as _i4;
import 'package:tonder/service/cache/cache.dart' as _i2;
import 'package:tonder/service/network/network.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [Cache].
///
/// See the documentation for Mockito's code generation for more information.
class MockCache extends _i1.Mock implements _i2.Cache {
  MockCache() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> init() => (super.noSuchMethod(Invocation.method(#init, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<bool> addToFavorite(_i4.Partner? partner) =>
      (super.noSuchMethod(Invocation.method(#addToFavorite, [partner]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> addToLike(_i4.Partner? partner) =>
      (super.noSuchMethod(Invocation.method(#addToLike, [partner]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> removeLike(_i4.Partner? partner) =>
      (super.noSuchMethod(Invocation.method(#removeLike, [partner]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<List<_i4.Partner>> getFavorites() =>
      (super.noSuchMethod(Invocation.method(#getFavorites, []),
              returnValue: Future<List<_i4.Partner>>.value(<_i4.Partner>[]))
          as _i3.Future<List<_i4.Partner>>);
  @override
  _i3.Future<List<_i4.Partner>> getLikes() =>
      (super.noSuchMethod(Invocation.method(#getLikes, []),
              returnValue: Future<List<_i4.Partner>>.value(<_i4.Partner>[]))
          as _i3.Future<List<_i4.Partner>>);
  @override
  _i3.Future<bool> addToPass(_i4.Partner? partner) =>
      (super.noSuchMethod(Invocation.method(#addToPass, [partner]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> removePass(_i4.Partner? partner) =>
      (super.noSuchMethod(Invocation.method(#removePass, [partner]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<List<_i4.Partner>> getPass() =>
      (super.noSuchMethod(Invocation.method(#getPass, []),
              returnValue: Future<List<_i4.Partner>>.value(<_i4.Partner>[]))
          as _i3.Future<List<_i4.Partner>>);
}

/// A class which mocks [Network].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetwork extends _i1.Mock implements _i5.Network {
  MockNetwork() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Partner>> getListPartner() =>
      (super.noSuchMethod(Invocation.method(#getListPartner, []),
              returnValue: Future<List<_i4.Partner>>.value(<_i4.Partner>[]))
          as _i3.Future<List<_i4.Partner>>);
}
