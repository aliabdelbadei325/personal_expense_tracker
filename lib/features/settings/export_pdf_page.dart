import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_theme.dart';
import '../../services/auth_service.dart';
import '../../services/firestore_service.dart';

class ExportPdfPage extends StatefulWidget {
  final int year;
  final int month;

  const ExportPdfPage({
    super.key,
    required this.year,
    required this.month,
  });

  @override
  State<ExportPdfPage> createState() => _ExportPdfPageState();
}

class _ExportPdfPageState extends State<ExportPdfPage> {
  final _firestoreService = FirestoreService();

  Future<pw.Document> _generatePdf(String userId) async {
    final pdf = pw.Document();
    final summary = await _firestoreService.getMonthlySummary(
      userId,
      widget.year,
      widget.month,
    );

    final totalAmount = summary.values.fold(0.0, (a, b) => a + b);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Expense Report',
                style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                '${DateFormat.MMMM().format(DateTime(widget.year, widget.month))} ${widget.year}',
                style: const pw.TextStyle(fontSize: 16),
              ),
              pw.Divider(),
              pw.SizedBox(height: 16),
              pw.Text(
                'Total Expenses: ${totalAmount.toStringAsFixed(2)} EGP',
                style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 24),
              pw.Text(
                'Breakdown by Category:',
                style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 12),
              pw.Table.fromTextArray(
                headers: ['Category', 'Amount', 'Percentage'],
                data: summary.entries.map((entry) {
                  final percentage = (entry.value / totalAmount) * 100;
                  return [
                    entry.key,
                    '${entry.value.toStringAsFixed(2)} EGP',
                    '${percentage.toStringAsFixed(1)}%',
                  ];
                }).toList(),
              ),
            ],
          );
        },
      ),
    );

    return pdf;
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final userId = authService.currentUser!.uid;

    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        title: const Text('📄 Export PDF'),
      ),
      body: PdfPreview(
        build: (format) async {
          final pdf = await _generatePdf(userId);
          return pdf.save();
        },
      ),
    );
  }
}