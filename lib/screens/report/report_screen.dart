// lib/screens/reports/report_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool isPro = false;
  List<Map<String, dynamic>> raporlar = [];

  @override
  void initState() {
    super.initState();
    _paketiKontrolEt();
    _verileriGetir();
  }

  Future<void> _paketiKontrolEt() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    setState(() {
      isPro = userDoc.data()?['plan'] == 'pro';
    });
  }

  Future<void> _verileriGetir() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('raporlar').get();

    setState(() {
      raporlar =
          snapshot.docs
              .map((e) => e.data())
              .toList()
              .cast<Map<String, dynamic>>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Raporlama')),
      body: isPro ? _proRapor() : _starterRapor(),
    );
  }

  Widget _starterRapor() {
    return ListView.builder(
      itemCount: raporlar.length,
      itemBuilder: (context, index) {
        final rapor = raporlar[index];
        return ListTile(
          title: Text(rapor['baslik'] ?? 'Rapor'),
          subtitle: Text(rapor['tarih'] ?? ''),
        );
      },
    );
  }

  Widget _proRapor() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < raporlar.length) {
                    return Text(raporlar[index]['baslik'] ?? '');
                  }
                  return const Text('');
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups:
              raporlar.asMap().entries.map((entry) {
                final index = entry.key;
                final data = entry.value;
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: (data['deger'] ?? 0).toDouble(),
                      width: 20,
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
