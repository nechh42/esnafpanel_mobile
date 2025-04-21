import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';
import 'package:esnafpanel_mobile/screens/business/business_selection_screen.dart';
import 'package:esnafpanel_mobile/screens/main_panel/main_panel_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (authResult.user != null) {
        final businessProvider = Provider.of<BusinessProvider>(
          context,
          listen: false,
        );
        final selectedBusiness = businessProvider.selectedBusiness;

        if (selectedBusiness == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const BusinessSelectionScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MainPanelScreen()),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Giriş başarısız: ${e.message}")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giriş Yap')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-posta'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty ? 'E-posta gerekli' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Şifre'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Şifre gerekli' : null,
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: _login,
                    child: const Text('Giriş Yap'),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
