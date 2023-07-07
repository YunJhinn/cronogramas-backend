// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.account_circle),
        // leadingWidth: 100,
        title: const Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "E-mail",
                      prefixIcon: Icon(Icons.alternate_email)),
                  validator: (value) {
                    if (value!.length < 5) {
                      return "Este e-mail parece curto demais";
                    } else if (!value.contains("@")) {
                      return "Este e-mail não é válido";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Senha",
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/home');
                    Navigator.pushNamed(context, '/pagina');
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.only(top: 25, bottom: 25)),
                  ),
                  child: const Text("Entrar"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastro');
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.only(top: 25, bottom: 25)),
                  ),
                  child: const Text("Cadastrar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
