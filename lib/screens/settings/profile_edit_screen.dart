// lib/screens/settings/profile_edit_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/models/business_model.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _ownerName;
  bool _isPopular = false;

  @override
  void initState() {
    super.initState();
    final business =
        Provider.of<BusinessProvider>(context, listen: false).selectedBusiness;
    _name = business?.name;
    _ownerName = business?.ownerName;
    _isPopular = business?.isPopular ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BusinessProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Profil Düzenle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'İşletme Adı'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Boş bırakılamaz'
                            : null,
                onSaved: (value) => _name = value,
              ),
              TextFormField(
                initialValue: _ownerName,
                decoration: const InputDecoration(labelText: 'Sahip Adı'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Boş bırakılamaz'
                            : null,
                onSaved: (value) => _ownerName = value,
              ),
              SwitchListTile(
                title: const Text('Popüler olarak işaretle'),
                value: _isPopular,
                onChanged: (value) {
                  setState(() {
                    _isPopular = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final updatedBusiness = BusinessModel(
                      id: provider.selectedBusiness!.id,
                      name: _name!,
                      ownerName: _ownerName!,
                      isPopular: _isPopular,
                    );
                    provider.updateBusiness(updatedBusiness);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
