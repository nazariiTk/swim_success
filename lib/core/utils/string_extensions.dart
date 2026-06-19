extension StringExtensions on String {
  String getInitials() {
    if (isEmpty) return '?';
    final parts = trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      return parts[0].isEmpty ? '?' : parts[0][0].toUpperCase();
    }
    
    final first = parts[0].isNotEmpty ? parts[0][0] : '';
    final second = parts[1].isNotEmpty ? parts[1][0] : '';
    final initials = '$first$second'.toUpperCase();
    
    return initials.isEmpty ? '?' : initials;
  }
}
