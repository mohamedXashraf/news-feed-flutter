

const List<String> days = [
  "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
];

const List<String> months = [
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
];

String parseDate(String date) {
  if (date == "") return "";
  var dateTime = DateTime.parse(date);
  var time = "";
  if (dateTime.hour > 12) {
    time = "${dateTime.hour-12}:${dateTime.minute} PM";
  } else if (dateTime.hour == 12) {
    time = "${dateTime.hour}:${dateTime.minute} PM";
  } else if (dateTime.hour == 0) {
    time = "12:${dateTime.minute} AM";
  } else {
    time = "${dateTime.hour}:${dateTime.minute} AM";
  }
  return "${dateTime.day}, ${months[dateTime.month-1]} ${dateTime.year} at $time";
}