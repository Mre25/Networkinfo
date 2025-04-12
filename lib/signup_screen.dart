import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'custom_textfield.dart';
import 'auth_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'إنشاء حساب جديد',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: _emailController,
                label: 'البريد الإلكتروني',
                validator: (value) {
                  if (value!.isEmpty) return 'يجب إدخال البريد الإلكتروني';
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: _passwordController,
                label: 'كلمة المرور',
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) return 'يجب إدخال كلمة المرور';
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: _confirmPasswordController,
                label: 'تأكيد كلمة المرور',
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'كلمة المرور غير متطابقة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              AuthButton(
                text: 'إنشاء حساب',
                onPressed: _signup,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                child: const Text('لديك حساب بالفعل؟ سجل الدخول'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
