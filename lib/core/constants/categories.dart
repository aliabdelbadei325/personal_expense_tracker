class AppCategories {
  static const List<Map<String, dynamic>> categories = [
    {'name': 'Food', 'icon': '🍔', 'color': 0xFFFF6B6B},
    {'name': 'Transport', 'icon': '🚗', 'color': 0xFF4ECDC4},
    {'name': 'Entertainment', 'icon': '🎮', 'color': 0xFF95E1D3},
    {'name': 'Bills', 'icon': '💡', 'color': 0xFFF38181},
    {'name': 'Shopping', 'icon': '🛒', 'color': 0xFFAA96DA},
    {'name': 'Health', 'icon': '🏥', 'color': 0xFFFCBAD3},
    {'name': 'Education', 'icon': '📚', 'color': 0xFFA8D8EA},
    {'name': 'Other', 'icon': '📦', 'color': 0xFFFFD93D},
  ];

  static String getIcon(String category) {
    final cat = categories.firstWhere(
          (c) => c['name'] == category,
      orElse: () => categories.last,
    );
    return cat['icon'];
  }

  static int getColor(String category) {
    final cat = categories.firstWhere(
          (c) => c['name'] == category,
      orElse: () => categories.last,
    );
    return cat['color'];
  }
}