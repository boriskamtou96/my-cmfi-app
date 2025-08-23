import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.ok(T value) = Ok;
  const factory Result.error(Object error) = Error;
}
