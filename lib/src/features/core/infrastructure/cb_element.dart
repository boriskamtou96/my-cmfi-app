import 'package:freezed_annotation/freezed_annotation.dart';

part 'cb_element.freezed.dart';
part 'cb_element.g.dart';

@freezed
abstract class CBElement with _$CBElement {
  const factory CBElement({
    required int id,
    required String code,
    required String name,
    String? description,
    @Default(false) bool isSelected,
  }) = _CBElement;

  factory CBElement.fromJson(Map<String, dynamic> json) =>
      _$CBElementFromJson(json);
}
