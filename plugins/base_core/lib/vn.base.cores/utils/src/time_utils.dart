part of utils;

Uint8List md5(Uint8List data) => Uint8List.fromList(c.md5.convert(data).bytes);

Uint8List sha1(Uint8List data) =>
    Uint8List.fromList(c.sha1.convert(data).bytes);

Uint8List sha256(Uint8List data) =>
    Uint8List.fromList(c.sha256.convert(data).bytes);

DateTime utc() => DateTime.now().toUtc();

DateTime now() => DateTime.now();

int utcSec() => utcMs() ~/ 1000;

int utcMs() => utc().millisecondsSinceEpoch;

int utcUs() => utc().microsecondsSinceEpoch;

int nowSec() => nowMs() ~/ 1000;

int nowMs() => now().millisecondsSinceEpoch;

int nowUs() => now().microsecondsSinceEpoch;

int _serverTime = 0;
int _clientTime = 0;

void syncServerTimeSec(int sec) {
  _serverTime = sec;
  _clientTime = utcSec();
}

int serverTimeUtcSec() => utcSec() - _clientTime + _serverTime;

extension StringExtension on String {
  String get weekDayVN {
    switch (this) {
      case 'Mon':
        return 'T2';
      case 'Tue':
        return 'T3';
      case 'Wed':
        return 'T4';
      case 'Thu':
        return 'T5';
      case 'Fri':
        return 'T6';
      case 'Sat':
        return 'T7';
      case 'Sun':
        return 'CN';
    }
    return this;
  }

  String get weekdayNumberVn {
    switch (this.toLowerCase()) {
      case 'monday':
        return 'Thứ 2';
      case 'tuesday':
        return 'Thứ 3';
      case 'wednesday':
        return 'Thứ 4';
      case 'thursday':
        return 'Thứ 5';
      case 'friday':
        return 'Thứ 6';
      case 'saturday':
        return 'Thứ 7';
      case 'sunday':
        return 'CN';
    }
    return this;
  }

  int get toTimeStampSlash {
    DateTime parse =
        DateTime.parse(DateFormat('dd/MM/yyyy').parse(this).toString());
    int timestamp = parse.millisecondsSinceEpoch ~/ 1000;
    return timestamp.toInt();
  }

  int get toTimeStampSlashHHmm {
    DateTime parse =
        DateTime.parse(DateFormat('dd/MM/yyyy HH:mm').parse(this).toString());
    int timestamp = parse.millisecondsSinceEpoch ~/ 1000;
    return timestamp.toInt();
  }

  DateTime get toDateSlashHHmm {
    return DateTime.parse(
        DateFormat('dd/MM/yyyy HH:mm').parse(this).toString());
  }

  int get toMillisecond {
    return DateFormat('dd/MM/yyyy HH:mm').parse(this).millisecondsSinceEpoch ~/
        1000;
  }

  int get toTimeStampDot {
    DateTime parse =
        DateTime.parse(DateFormat('dd.MM.yyyy').parse(this).toString());
    int timestamp = parse.millisecondsSinceEpoch ~/ 1000;
    return timestamp.toInt();
  }
}

extension IntExtension on int {
  String get toDateSlash {
    DateTime dateTimeFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(this * 1000);
    String time =
        DateFormat('dd/MM/yyyy').format(dateTimeFromTimeStamp).toString();
    return time;
  }

  String get toDateFromIntDot {
    String dateString = this.toString();
    if (dateString.length == 8) {
      String year = dateString.substring(0, 4);
      String month = dateString.substring(4, 6);
      String day = dateString.substring(6, 8);
      return '${day}.${month}.${year}';
    } else {
      return '';
    }
  }

  String get toDateFromIntSlash {
    String dateString = this.toString();
    if (dateString.length == 8) {
      String year = dateString.substring(0, 4);
      String month = dateString.substring(4, 6);
      String day = dateString.substring(6, 8);
      return '${day}/${month}/${year}';
    } else {
      return '';
    }
  }

  String get toWeekdayDateTime {
    DateTime dateTimeFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat('EEEE, dd/MM/yyyy').format(dateTimeFromTimeStamp);
  }

  String get toFullDateTime {
    DateTime dateTimeFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat('EEEE, dd, MMMM, yyyy, hh:mm a')
        .format(dateTimeFromTimeStamp);
  }

  String get toWeekDay {
    DateTime dateTimeFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(this * 1000);
    String time = DateFormat('E').format(dateTimeFromTimeStamp).toString();
    return time;
  }

  String get toDateSlashHHmm {
    DateTime dateTimeFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(this * 1000);
    String time =
        DateFormat('dd/MM/yyyy HH:mm').format(dateTimeFromTimeStamp).toString();
    return time;
  }

  String get toHHmm {
    DateTime dateTimeFromTimeStamp = DateTime.fromMillisecondsSinceEpoch(this);
    String time = DateFormat('HH:mm').format(dateTimeFromTimeStamp).toString();
    return time;
  }

  List<int> get toListHHmm {
    DateTime dateTimeFromTimeStamp = DateTime.fromMillisecondsSinceEpoch(this);
    String time = DateFormat('HH:mm').format(dateTimeFromTimeStamp).toString();
    final items = time.split(':');
    return [int.parse(items[0]), int.parse(items[1])];
  }

  String get toDateSlashddMM {
    DateTime dateTimeFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(this * 1000);
    String time = DateFormat('dd/MM').format(dateTimeFromTimeStamp).toString();
    return time;
  }

  String get toDateDot {
    DateTime dateTimeFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(this * 1000);
    String time =
        DateFormat('dd.MM.yyyy').format(dateTimeFromTimeStamp).toString();
    return time;
  }

  String get toHrsMin {
    DateTime dateTimeFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(this * 1000);
    String time = DateFormat.Hm().format(dateTimeFromTimeStamp).toString();
    return time;
  }

  int get hrBefore {
    return (now().millisecondsSinceEpoch ~/ 1000 - this) ~/ 3600;
  }
}

int formatDatetimeToInt(String format, DateTime dateTime) {
  return int.parse(DateFormat(format).format(dateTime).toString());
}

DateTime parseStringToDateTime(String format, String str) {
  return DateTime.parse(str);
}

int toDateParam({required int year, required int month, required day}) {
  String res =
      '${year.toString()}${month < 10 ? '0${month.toString()}' : month}${day < 10 ? '0${day.toString()}' : day}';
  return int.parse(res);
}
