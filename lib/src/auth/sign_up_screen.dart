import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/coustom_text_field.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              // Titulo
              const Expanded(
                child: Center(
                  child: Text(
                    'Cadastro',
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
              // Formulário
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CoustomTextField(
                      icon: Icons.email,
                      label: 'Email',
                    ),
                    const CoustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),
                    const CoustomTextField(
                      icon: Icons.person,
                      label: 'Nome',
                    ),
                    const CoustomTextField(
                      icon: Icons.phone,
                      label: 'Celular',
                    ),
                    const CoustomTextField(
                      icon: Icons.file_copy,
                      label: 'CPF',
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Cadastrar usuário',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
