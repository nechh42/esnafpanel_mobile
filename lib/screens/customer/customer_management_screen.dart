import 'package:flutter/material.dart';

class CustomerManagementScreen extends StatelessWidget {
  const CustomerManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Müşteri Yönetimi')),
      body: ListView.builder(
        itemCount: 10, // Örnek veri sayısı
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text('Müşteri ${index + 1}'),
            subtitle: const Text('Telefon: 0500 000 00 00'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // düzenleme ekranına yönlendirme
              },
            ),
            onLongPress: () {
              showDialog(
                context: context,
                builder:
                    (_) => AlertDialog(
                      title: const Text('Müşteri Sil'),
                      content: const Text(
                        'Bu müşteriyi silmek istediğinize emin misiniz?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('İptal'),
                        ),
                        TextButton(
                          onPressed: () {
                            // silme işlemi
                            Navigator.pop(context);
                          },
                          child: const Text('Sil'),
                        ),
                      ],
                    ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Yeni müşteri ekleme ekranına yönlendirme
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
