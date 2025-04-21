import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/business_model.dart';
import '../../../providers/business_provider.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _ownerNameController;
  late bool _isPopular;

  @override
  void initState() {
    super.initState();
    final business =
        Provider.of<BusinessProvider>(context, listen: false).selectedBusiness;

    _nameController = TextEditingController(text: business?.name ?? '');
    _ownerNameController = TextEditingController(
      text: business?.ownerName ?? '',
    );
    _isPopular = business?.isPopular ?? false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ownerNameController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final updatedBusiness = BusinessModel(
        id:
            Provider.of<BusinessProvider>(
              context,
              listen: false,
            ).selectedBusiness?.id ??
            '',
        name: _nameController.text.trim(),
        ownerName: _ownerNameController.text.trim(),
        isPopular: _isPopular,
      );

      Provider.of<BusinessProvider>(
        context,
        listen: false,
      ).updateBusiness(updatedBusiness);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Profil güncellendi')));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Düzenle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'İşletme Adı'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'İşletme adı gerekli'
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ownerNameController,
                decoration: const InputDecoration(labelText: 'Sahip Adı'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Sahip adı gerekli'
                            : null,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Popüler İşletme'),
                value: _isPopular,
                onChanged: (value) {
                  setState(() {
                    _isPopular = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveChanges,
                child: const Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
