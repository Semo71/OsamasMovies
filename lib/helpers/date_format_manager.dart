import 'package:intl/intl.dart';

class DateManager {
  static const String DAY_MONTH_YEAR_SLASH = "dd/MM/yyyy";
  static const String DAY_MONTH_YEAR_SPACE = "dd MMMM yyyy";
  static const String DAY_MONTH_YEAR_SPACE_TIME = "dd/MM/yyyy  h:mm a";
  static const String TIME = "h:mm a";
  static const String HOTEL_SEARCH_DATE_FORMAT = "yyyy-MM-dd";
  static const String DAY_MONTH = "d MMM";
  static const String DAY_MONTH_TIME = "d MMM h:mm a";
  static const String TIME_WITH_SECOND = "HH:mm:ss";
  static const String TIME_IN_M = "m";
  static const String TIME_IN_H = "HH";
  static const String ISO_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";


  static const String ARABIC = "ar";


  static String format(String? unformattedDate,
      {String requiredFormat = DAY_MONTH_YEAR_SLASH}) {
    DateTime? date = DateTime.tryParse(unformattedDate??'');

    if (date == null) {
      //BugManager.getInstance().AddBug("Date Format bug    " + unformattedDate);
      return unformattedDate??'';
    } else {
      return DateFormat(requiredFormat).format(date);
    }
  }

  static int getMillSecond(String? unformattedDate,) {
    DateTime? date = DateTime.tryParse(unformattedDate??'');

    if (date == null) {
      return 0;
    } else {
      return date.millisecondsSinceEpoch;
    }
  }

  static String getMonthName(int month, String local) {
    DateTime date = DateTime(0, month);
    return DateFormat('MMM', local).format(date);
  }

  static String getHourIn12Mode(String hour) {
    int hourInt;
    try {
      hourInt = int.parse(hour);
    } catch (e) {
      hourInt = 0;
    }

    DateTime date = DateTime(
      0,
      0,
      0,
      hourInt,
    );
    return DateFormat('j', 'en_US').format(date);
  }
}
