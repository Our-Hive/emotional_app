class DateTimeFormatter {
  static String getFormattedDate(DateTime? date) {
    if (date == null) return '';
    final List<String> dateString = date.toString().split(' ')[0].split('-');
    for (int i = 0; i < dateString.length; i++) {
      if (dateString[i].length == 1) {
        dateString[i] = "0${dateString[i]}";
      }
    }
    return "${dateString[2]}/${dateString[1]}/${dateString[0]}";
  }
}
