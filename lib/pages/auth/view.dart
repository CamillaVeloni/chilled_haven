import 'package:chilled_haven/pages/auth/widgets/login_text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/widgets/logo_widget.dart';
import 'controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.keyForm,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 34, horizontal: 24),
                  child: Column(
                    children: <Widget>[
                      const LogoWidget(height: 120, width: 120),
                      Text(
                        'Paraíso Congelado',
                        style: GoogleFonts.pacifico(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '🌴🌞 Sua Sorveteria Tropical no conforto do seu celular',
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                // Login part form
                LoginTextInput(
                  controller: controller.emailController,
                  labelText: 'Digite seu e-mail',
                  required: true,
                  keyboardType: TextInputType.emailAddress,
                ),
                LoginTextInput(
                  controller: controller.passwordController,
                  labelText: 'Digite sua senha',
                  obscureText: true,
                  required: true,
                ),
                // Register part form
                Obx(
                  () => !controller.isLogin
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            LoginTextInput(
                              controller: controller.nameController,
                              labelText: 'Digite seu nome completo',
                              required: controller.requirementRegister,
                            ),
                            LoginTextInput(
                                controller: controller.phoneController,
                                labelText: 'Digite seu telefone/celular',
                                required: controller.requirementRegister,
                                keyboardType: TextInputType.phone),
                            Divider(color: Colors.grey.shade200),
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 28, top: 12, bottom: 8),
                              child: Text('Endereço de entrega',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ),
                            LoginTextInput(
                              controller: controller.zipCodeController,
                              labelText: 'Digite seu CEP',
                              textInputAction: TextInputAction.search,
                              onEditingComplete: controller.searchZipCode,
                              required: controller.requirementRegister,
                                keyboardType: TextInputType.number
                            ),
                            if (controller.isZipCodeValid)
                              Column(
                                children: <Widget>[
                                  LoginTextInput(
                                    controller: controller.stateController,
                                    labelText: 'Digite o nome do Estado',
                                    required: controller.requirementRegister,
                                  ),
                                  LoginTextInput(
                                    controller: controller.cityController,
                                    labelText: 'Digite o nome da cidade',
                                    required: controller.requirementRegister,
                                  ),
                                  LoginTextInput(
                                    controller:
                                        controller.neighborhoodController,
                                    labelText: 'Digite o nome do bairro',
                                    required: controller.requirementRegister,
                                  ),
                                  LoginTextInput(
                                    controller: controller.streetController,
                                    labelText: 'Digite o nome da rua',
                                    required: controller.requirementRegister,
                                  ),
                                  LoginTextInput(
                                    controller: controller.numberController,
                                    labelText: 'Digite o número',
                                    required: controller.requirementRegister,
                                  ),
                                  LoginTextInput(
                                    controller: controller.complementController,
                                    labelText:
                                        'Digite um complemento (opcional)',
                                  ),
                                ],
                              )
                          ],
                        )
                      : Container(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: ElevatedButton(
                    onPressed: controller.onButtonClick,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(18),
                    ),
                    child: Obx(() => Text(controller.btnText)),
                  ),
                ),
                TextButton(
                  onPressed: controller.changeLoginStatus,
                  child: Obx(() => Text(controller.btnChangeStatusText)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
