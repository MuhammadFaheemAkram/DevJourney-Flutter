import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

/// The first state of [bloc] (its current one included) that [test]
/// accepts. Bounded: a state that never comes fails in [timeout] instead of
/// hanging the suite.
Future<S> waitFor<S>(
  BlocBase<S> bloc,
  bool Function(S state) test, {
  Duration timeout = const Duration(seconds: 5),
}) {
  if (test(bloc.state)) return Future.value(bloc.state);
  return bloc.stream.firstWhere(test).timeout(timeout);
}
