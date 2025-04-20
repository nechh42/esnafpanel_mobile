import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportScreen extends StatelessWidget {
  final String userPlan; // 'starter' or 'pro'

  const ReportScreen({super.key, required this.userPlan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Raporlama')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: userPlan == 'pro' ? _buildProReport() : _buildStarterReport(),
      ),
    );
  }

  Widget _buildStarterReport() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Genel İşlem Özeti',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Text('Toplam Müşteri: 25'),
        Text('Toplam Sipariş: 40'),
        Text('En Aktif Gün: Çarşamba'),
        Text('En Çok Talep: Bakım Paketi'),
      ],
    );
  }

  Widget _buildProReport() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Filtreli Grafiksel Raporlama',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text('Aylık Sipariş Grafiği'),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 1.7,
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(show: false),
              barGroups: [
                BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 10)]),
                BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 15)]),
                BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 8)]),
                BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 12)]),
              ],
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 0:
                          return const Text('Ocak');
                        case 1:
                          return const Text('Şubat');
                        case 2:
                          return const Text('Mart');
                        case 3:
                          return const Text('Nisan');
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
