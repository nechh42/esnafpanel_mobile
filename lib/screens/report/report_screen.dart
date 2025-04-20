import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool isPro = false;

  @override
  void initState() {
    super.initState();
    // Demo amaçlı. Gerçek kullanımda Firebase'den kullanıcı paketi alınmalı.
    isPro = true; // veya false olarak değiştir
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Raporlama')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isPro ? _buildProReport() : _buildStarterReport(),
      ),
    );
  }

  Widget _buildStarterReport() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Özet Rapor',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('Toplam Müşteri: 42'),
        Text('Toplam Sipariş: 58'),
        Text('Toplam Gelir: ₺9.820'),
      ],
    );
  }

  Widget _buildProReport() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gelişmiş Rapor (Pro)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barTouchData: BarTouchData(enabled: true),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget:
                        (value, _) => Text(
                          [
                            'Pzt',
                            'Sal',
                            'Çar',
                            'Per',
                            'Cum',
                            'Cmt',
                            'Paz',
                          ][value.toInt()],
                          style: const TextStyle(fontSize: 10),
                        ),
                    interval: 1,
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: List.generate(7, (index) {
                return BarChartGroupData(
                  x: index,
                  barRods: [BarChartRodData(toY: (index + 1) * 2.0, width: 15)],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
