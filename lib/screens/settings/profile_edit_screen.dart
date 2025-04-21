// lib/screens/settings/profile_edit_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/business_provider.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final business =
        Provider.of<BusinessProvider>(context, listen: false).selectedBusiness;
    _nameController.text = business?.ownerName ?? "";
  }

  void _saveProfile() {
    final provider = Provider.of<BusinessProvider>(context, listen: false);
    provider.updateOwnerName(_nameController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profil bilgileri kaydedildi")),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Düzenle")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Ad Soyad",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _saveProfile,
              icon: const Icon(Icons.save),
              label: const Text("Kaydet"),
            ),
          ],
        ),
      ),
    );
  }
}
