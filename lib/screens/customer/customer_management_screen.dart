import 'package:flutter/material.dart';

class CustomerManagementScreen extends StatefulWidget {
  const CustomerManagementScreen({Key? key}) : super(key: key);

  @override
  State<CustomerManagementScreen> createState() =>
      _CustomerManagementScreenState();
}

class _CustomerManagementScreenState extends State<CustomerManagementScreen> {
  final List<Map<String, String>> customers = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void addCustomer() {
    if (nameController.text.isEmpty || phoneController.text.isEmpty) return;
    setState(() {
      customers.add({
        'name': nameController.text,
        'phone': phoneController.text,
      });
    });
    nameController.clear();
    phoneController.clear();
  }

  void deleteCustomer(int index) {
    setState(() {
      customers.removeAt(index);
    });
  }

  void showAddCustomerDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Yeni Müşteri Ekle'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'İsim'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Telefon'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('İptal'),
              ),
              ElevatedButton(
                onPressed: () {
                  addCustomer();
                  Navigator.pop(context);
                },
                child: const Text('Ekle'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Müşteri Yönetimi')),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddCustomerDialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder:
            (context, index) => ListTile(
              title: Text(customers[index]['name'] ?? ''),
              subtitle: Text(customers[index]['phone'] ?? ''),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => deleteCustomer(index),
              ),
            ),
      ),
    );
  }
}
