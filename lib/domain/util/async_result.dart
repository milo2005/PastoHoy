class Empty { }

sealed class AsyncResult<T, E> {
  static AsyncResult<T,E> successWithData<T, E>(T value) => Success(value);
  static AsyncResult<Empty,E> success<T extends Empty, E>() => Success(Empty());
  static AsyncResult<T,E> failure<T, E>(E exception) => Failure(exception);

  bool isFailure() {
    return this is Failure<T, E>;
  }

  bool isSuccess() {
    return this is Success<T, E>;
  }

  E getException() {
    return (this as Failure<T, E>).exception;
  }

  T getValue() {
    return (this as Success<T, E>).value;
  }

}

final class Success<T, E> extends AsyncResult<T, E>{
  final T value;
  Success(this.value);
}

final class Failure<T, E> extends AsyncResult<T, E>{
    final E exception;
    Failure(this.exception);
}

