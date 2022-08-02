import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages_route/app_pages.dart';

import '../../commom_widgets/app_name_widget.dart';
import '../../commom_widgets/coustom_text_field.dart';
import '../controller/auth_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nome do App
                    const AppNameWidget(
                      greenTitleColor: Colors.white,
                      textSize: 40,
                    ),
                    // Text.rich(
                    //   TextSpan(
                    //     style: const TextStyle(fontSize: 40),
                    //     children: [
                    //       const TextSpan(
                    //         text: 'Green',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       TextSpan(
                    //         text: 'grocer',
                    //         style: TextStyle(
                    //           color: CustomColors.customContrastColor,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Categorias
                    SizedBox(
                      height: 36,
                      child: DefaultTextStyle(
                        style: const TextStyle(fontSize: 25),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticíneos'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Email
                      CoustomTextField(
                        controller: emailCtrl,
                        icon: Icons.email,
                        label: 'E-mail',
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Digite seu e-mail!';
                          }

                          if (!email.isEmail) {
                            return 'Digite um e-mail válido!';
                          }

                          return null;
                        },
                      ),

                      //Senha
                      CoustomTextField(
                        controller: passCtrl,
                        icon: Icons.lock,
                        label: 'Senha',
                        isSecret: true,
                        validator: (pass) {
                          if (pass == null || pass.isEmpty) {
                            return 'Digite sua senha!';
                          }

                          if (pass.length < 7) {
                            return 'Digite uma senha com pelo menos 7 caracteres!';
                          }

                          return null;
                        },
                      ),

                      SizedBox(
                        height: 50,
                        child: GetX<AuthController>(
                          builder: (authController) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                      // abaixa o teclado que o botão é clicado.
                                      FocusScope.of(context).unfocus();

                                      // Verifica todos os validator dos campos de entrada
                                      if (_formKey.currentState!.validate()) {
                                        String email = emailCtrl.text;
                                        String pass = passCtrl.text;
                                        authController.signIn(
                                          email: email,
                                          pass: pass,
                                        );
                                      } else {
                                        print('Campos não válidos!!');
                                      }
                                      //retira a tela atual da pilha e substitui pela nova tela
                                      // Get.offNamed(PagesRoutes.baseRoute);
                                    },
                              child: authController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      'Entrar',
                                      style: TextStyle(fontSize: 18),
                                    ),
                            );
                          },
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ),
                          ),
                        ),
                      ),
                      //Divisor
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Ou'),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Botão Criar Conta
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            side:
                                const BorderSide(width: 2, color: Colors.green),
                          ),
                          onPressed: () {
                            Get.toNamed(PagesRoutes.signUpRoute);
                          },
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
