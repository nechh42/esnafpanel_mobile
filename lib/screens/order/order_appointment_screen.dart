import 'package:flutter/material.dart';

class OrderAppointmentScreen extends StatefulWidget {
  const OrderAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<OrderAppointmentScreen> createState() => _OrderAppointmentScreenState();
}

class _OrderAppointmentScreenState extends State<OrderAppointmentScreen> {
  final List<Map<String, String>> entries = [];

  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _addEntry() {
    if (_typeController.text.isEmpty || _descriptionController.text.isEmpty)
      return;

    setState(() {
      entries.add({
        'type': _typeController.text,
        'description': _descriptionController.text,
        'date': DateTime.now().toString().substring(0, 16),
      });
      _typeController.clear();
      _descriptionController.clear();
    });
  }

  void _removeEntry(int index) {
    setState(() {
      entries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sipariş ve Randevular')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Yeni Kayıt',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _typeController,
              decoration: const InputDecoration(
                labelText: 'Tür (Sipariş / Randevu)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Açıklama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _addEntry, child: const Text('Ekle')),
            const SizedBox(height: 20),
            const Divider(),
            const Text(
              'Geçmiş Kayıtlar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  return ListTile(
                    title: Text('${entry['type']}: ${entry['description']}'),
                    subtitle: Text('Tarih: ${entry['date']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeEntry(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
