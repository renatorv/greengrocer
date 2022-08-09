import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu e-mail!';
  }

  if (!email.isEmail) {
    return 'Digite um e-mail válido!';
  }

  return null;
}

String? passwordValidator(String? pass) {
  if (pass == null || pass.isEmpty) {
    return 'Digite sua senha!';
  }

  if (pass.length < 7) {
    return 'Digite uma senha com pelo menos 7 caracteres!';
  }

  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite um nome!';
  }

  final names = name.split(' ');

  if (names.length == 1) {
    return 'Digite seu nome completo!';
  }

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite um celular!';
  }

  if (!phone.isPhoneNumber) {
    return 'Digite um número válido!';
  }

  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite um CPF!';
  }

  if (!cpf.isCpf) {
    return 'Digite um CPF válido!';
  }

  return null;
}
