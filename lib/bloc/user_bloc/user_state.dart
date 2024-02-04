import 'package:code_master/models/user_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    UserModel? user,
    @Default(false) bool? isLoading,
    String? authMethod,
  }) = _UserState;
}
