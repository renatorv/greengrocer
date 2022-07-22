import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/commom_widgets/coustom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: const [
          // E-mail
          CoustomTextField(
            icon: Icons.email,
            label: 'Email',
          ),

          // Nome
          CoustomTextField(
            icon: Icons.person,
            label: 'Nome',
          ),

          // Celular
          CoustomTextField(
            icon: Icons.phone,
            label: 'Celular',
          ),

          // CPF
          CoustomTextField(
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),

          // Botão para atualizar a senha
        ],
      ),
    );
  }
}
