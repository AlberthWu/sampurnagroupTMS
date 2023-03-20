String waktu() {
  var dateTime = DateTime.now().toString();
  if (dateTime.isNotEmpty) {
    return dateTime;
  } else {
    return 'error';
  }
}
