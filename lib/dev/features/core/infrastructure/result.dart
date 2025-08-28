import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const Result._();
  const factory Result.ok(T value) = _Ok;
  const factory Result.error(Object error) = _Error;
}
