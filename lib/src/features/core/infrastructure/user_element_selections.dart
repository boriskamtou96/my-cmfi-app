import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_element_selections.freezed.dart';
part 'user_element_selections.g.dart';

@freezed
abstract class UserElementSelections with _$UserElementSelections {
  const factory UserElementSelections({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'cb_element_id') required int cbElementId,
  }) = _UserElementSelections;

  factory UserElementSelections.fromJson(Map<String, dynamic> json) =>
      _$UserElementSelectionsFromJson(json);
}
