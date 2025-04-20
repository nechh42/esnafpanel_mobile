import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderAppointmentScreen extends StatefulWidget {
  const OrderAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<OrderAppointmentScreen> createState() => _OrderAppointmentScreenState();
}

class _OrderAppointmentScreenState extends State<OrderAppointmentScreen> {
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _addEntry() async {
    if (_typeController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _selectedDate == null)
      return;

    await FirebaseFirestore.instance.collection('order_appointments').add({
      'type': _typeController.text,
      'description': _descriptionController.text,
      'date': _selectedDate!.toIso8601String(),
      'createdAt': Timestamp.now(),
    });

    _typeController.clear();
    _descriptionController.clear();
    setState(() => _selectedDate = null);
  }

  Future<void> _deleteEntry(String docId) async {
    await FirebaseFirestore.instance
        .collection('order_appointments')
        .doc(docId)
        .delete();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now.subtract(const Duration(days: 0)),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sipariş / Randevu')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _typeController,
                  decoration: const InputDecoration(
                    labelText: 'Tür (Sipariş / Randevu)',
                  ),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Açıklama'),
                ),
                Row(
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Tarih seçilmedi'
                          : _selectedDate.toString().split(' ')[0],
                    ),
                    TextButton(
                      onPressed: _pickDate,
                      child: const Text('Tarih Seç'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: _addEntry,
                  child: const Text('Kaydet'),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance
                      .collection('order_appointments')
                      .orderBy('createdAt', descending: true)
                      .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return const Center(child: CircularProgressIndicator());
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index];
                    return ListTile(
                      title: Text(data['type']),
                      subtitle: Text(
                        "${data['description']}\n${data['date'].toString().split('T')[0]}",
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteEntry(data.id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
