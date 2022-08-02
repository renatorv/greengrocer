class UserModel {
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? token;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.id,
    this.token,
  });

  // Construtor nomeado que retorna instâncias da classe baseadas em um Map
  // Recebe-se um Map e devolve-se um uma instância de objeto
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cpf: map['cpf'],
      email: map['email'],
      id: map['id'],
      name: map['fullname'],
      password: map[''],
      phone: map['phone'],
      token: map['token'],
    );
  }

  // Transforma um objeto em um Map.
  // Utilizado quando tivermos um objeto para realizar um cadastro e for necessário envia-lo para o back
  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'email': email,
      'id': id,
      'fullname': name,
      'password': password,
      'phone': phone,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'name: $name | cpf: $cpf';
  }
}
