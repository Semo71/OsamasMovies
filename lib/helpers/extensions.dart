import 'dart:math';
import 'package:intl/intl.dart';
import '../generated/l10n.dart';


extension ToDate on int?{
  String toDate(){
    if(this==null){
      return '';
    }
    var date = DateTime.fromMillisecondsSinceEpoch(this!);
    return DateFormat('dd/MM/yyyy', 'en_US').format(date);
  }
}
extension ToStringCustom on double? {
  String toStringCustom() {
    if(this == null||this == 0){
      return '';
    }
    return toString();
  }
}

extension Digitize on double {
  double get digitize {
    num mod = pow(10.0, 2);
    return ((this * mod).round().toDouble() / mod);
  }
}


extension WithCurrency2 on double? {
  String get withCurrency {
    if(this == null) {
      return '';
    }
    return '${this!.digitize} ${S.current.sar}';
  }
}

extension WithCurrency on double {
  String get withCurrency => '$digitize ${S.current.sar}';
}


extension Lists <T> on List<T> {
  T? tryToGet(int index) {
    try{
      return this[index];
    }catch(e){
      return null;
    }
  }
}