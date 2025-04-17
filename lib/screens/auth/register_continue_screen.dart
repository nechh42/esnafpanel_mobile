import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterContinueScreen extends StatefulWidget {
  const RegisterContinueScreen({super.key});

  @override
  State<RegisterContinueScreen> createState() => _RegisterContinueScreenState();
}

class _RegisterContinueScreenState extends State<RegisterContinueScreen> {
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();

  bool isLoading = false;

  Future<void> _saveBusinessInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final businessName = _businessNameController.text.trim();
    final sector = _sectorController.text.trim();

    if (businessName.isEmpty || sector.isEmpty) return;

    setState(() => isLoading = true);

    try {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'businessName': businessName,
        'sector': sector,
        'setupCompleted': true,
      });

      Navigator.pushReplacementNamed(context, '/subscription');
    } catch (e) {
      debugPrint("Firestore kayıt hatası: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("İşletme Bilgileri")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _businessNameController,
              decoration: const InputDecoration(labelText: "İşletme Adı"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _sectorController,
              decoration: const InputDecoration(labelText: "Sektör"),
            ),
            const SizedBox(height: 24),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: _saveBusinessInfo,
                  child: const Text("Devam Et"),
                ),
          ],
        ),
      ),
    );
  }
}
