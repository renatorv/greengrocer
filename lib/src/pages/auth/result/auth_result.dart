import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greengrocer/src/models/user_model.dart';

// mesmo nome do arquivo.freezed.dart
part 'auth_result.freezed.dart';

@freezed
class AuthResult with _$AuthResult {
  // É possível ter dois retornos:
  // em caso de sucesso, será devolvido um objeto
  factory AuthResult.success(UserModel user) = Sucess;

  // em caso de erro, será devolvida uma msg
  factory AuthResult.error(String msg) = Error;

  // após isso gerar todo o código com o Freezed.
  // flutter pub run build_runner build
}
