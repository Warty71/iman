import 'package:iman/models/user_model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    User? user,
    @Default(false) bool? isLoading,
    String? authMethod,
  }) = _UserState;
}
