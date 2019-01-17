class ElapsedTime {
  ElapsedTime({
    this.hundreds,
    this.seconds,
    this.minutes,
  });
  final int hundreds;
  final int seconds;
  final int minutes;

  String format(int milliseconds) {
    final int hundreds = (milliseconds / 10).truncate();
    final int seconds = (hundreds / 100).truncate();
    final int minutes = (seconds / 60).truncate();

    final String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    final String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    final String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr.$hundredsStr';
  }
}
