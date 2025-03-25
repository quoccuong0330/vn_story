class FormatTime {
  static String formatTime(int timeInMinutes) {
    int minutes = timeInMinutes ~/ 60;
    int seconds = timeInMinutes % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
