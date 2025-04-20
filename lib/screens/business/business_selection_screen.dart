import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessSelectionScreen extends StatefulWidget {
  const BusinessSelectionScreen({Key? key}) : super(key: key);

  @override
  State<BusinessSelectionScreen> createState() =>
      _BusinessSelectionScreenState();
}

class _BusinessSelectionScreenState extends State<BusinessSelectionScreen> {
  List<Map<String, dynamic>> businesses = [];
  bool isLoading = true;
  String? userId;

  @override
  void initState() {
    super.initState();
    fetchBusinesses();
  }

  Future<void> fetchBusinesses() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');

    if (userId == null) {
      // Kullanıcı ID’si yoksa login ekranına yönlendir
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }

    final snapshot =
        await FirebaseFirestore.instance
            .collection('businesses')
            .where('ownerId', isEqualTo: userId)
            .get();

    if (snapshot.docs.isEmpty) {
      Navigator.pushReplacementNamed(context, '/businessInfo');
      return;
    }

    setState(() {
      businesses =
          snapshot.docs
              .map((doc) => {'id': doc.id, 'name': doc['name'] ?? 'İsimsiz'})
              .toList();
      isLoading = false;
    });
  }

  Future<void> selectBusiness(String businessId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedBusinessId', businessId);
    Navigator.pushReplacementNamed(context, '/mainPanel');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('İşletme Seç')),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Lütfen bir işletme seçin:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: businesses.length,
                        itemBuilder: (context, index) {
                          final business = businesses[index];
                          return Card(
                            child: ListTile(
                              title: Text(business['name']),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () => selectBusiness(business['id']),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed:
                          () => Navigator.pushNamed(context, '/businessInfo'),
                      icon: const Icon(Icons.add_business),
                      label: const Text('Yeni İşletme Oluştur'),
                    ),
                  ],
                ),
              ),
    );
  }
}
