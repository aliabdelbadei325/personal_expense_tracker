import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/expense_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'expenses';

  // Add expense
  Future<void> addExpense(ExpenseModel expense) async {
    await _firestore.collection(_collection).add(expense.toMap());
  }

  // Update expense
  Future<void> updateExpense(ExpenseModel expense) async {
    if (expense.id == null) return;
    await _firestore
        .collection(_collection)
        .doc(expense.id)
        .update(expense.toMap());
  }

  // Delete expense
  Future<void> deleteExpense(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }

  // Get all expenses for user
  Stream<List<ExpenseModel>> getExpenses(String userId) {
    return _firestore
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => ExpenseModel.fromFirestore(doc))
        .toList());
  }
// Get monthly summary - UPDATED
  Future<Map<String, double>> getMonthlySummary(
      String userId,
      int year,
      int month,
      ) async {
    final startDate = DateTime(year, month, 1);
    final endDate = DateTime(year, month + 1, 0, 23, 59, 59);


    final snapshot = await _firestore
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .get();

    Map<String, double> summary = {};


    for (var doc in snapshot.docs) {
      final expense = ExpenseModel.fromFirestore(doc);


      if (expense.date.isAfter(startDate.subtract(const Duration(seconds: 1))) &&
          expense.date.isBefore(endDate.add(const Duration(seconds: 1)))) {
        summary[expense.category] =
            (summary[expense.category] ?? 0) + expense.amount;
      }
    }

    return summary;
  }

// Get expenses by date range - UPDATED
  Stream<List<ExpenseModel>> getExpensesByDateRange(
      String userId,
      DateTime startDate,
      DateTime endDate,
      ) {
    return _firestore
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      // نفلتر حسب التاريخ يدوياً
      return snapshot.docs
          .map((doc) => ExpenseModel.fromFirestore(doc))
          .where((expense) =>
      expense.date.isAfter(startDate.subtract(const Duration(seconds: 1))) &&
          expense.date.isBefore(endDate.add(const Duration(seconds: 1))))
          .toList()
        ..sort((a, b) => b.date.compareTo(a.date)); // ترتيب تنازلي
    });
  }
}