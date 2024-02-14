abstract class EitherOf<Reject, Resolve> {
  const EitherOf();

  T get<T>(
    T Function(Reject reject) ifFailure,
    T Function(Resolve resolve) ifSuccess,
  );

  bool isFailure() => get((_) => true, (_) => false);
  bool isSuccess() => get((_) => false, (_) => true);
  Resolve getOrElse(Resolve Function() dflt) => get((_) => dflt(), id);

  Resolve toSuccess<T>() => get(
        (_) => throw AssertionError(
          'Either instance is not Right! You must check before with the isRight() method.',
        ),
        (success) => success,
      );

  Reject toFailure<T>() => get(
        (failure) => failure,
        (_) => throw AssertionError(
          'Either instance is not Left! You must check before with the isLeft() method.',
        ),
      );
}

A id<A>(A a) => a;

class Success<Reject, Resolve> extends EitherOf<Reject, Resolve> {
  const Success(this._resolve);

  final Resolve _resolve;

  @override
  T get<T>(T Function(Reject reject) ifFailure, T Function(Resolve resolve) ifSuccess) => ifSuccess(_resolve);
}

class Failure<Reject, Resolve> extends EitherOf<Reject, Resolve> {
  const Failure(this._reject);

  final Reject _reject;

  @override
  T get<T>(T Function(Reject reject) ifFailure, T Function(Resolve resolve) ifSuccess) => ifFailure(_reject);
}
