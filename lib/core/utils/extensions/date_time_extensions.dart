extension DateTimeExtensions on DateTime {
  DateTime getTheDateWithFirstDayOfThePreviousMonth() {
    int countTheDaysOfPreviousMonth = this.copyWith(day: 0).day;

    return this
        .subtract(Duration(days: this.day + countTheDaysOfPreviousMonth - 1));
  }

  DateTime getTheDateWithLasttDayOfThePreviousMonth() {
    int countTheDaysOfPreviousMonth = this.copyWith(day: 0).day;

    return this
        .copyWith(day: countTheDaysOfPreviousMonth, month: this.month - 1);
  }



// DateTime





}
