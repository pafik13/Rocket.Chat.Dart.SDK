library models;

import 'package:json_annotation/json_annotation.dart';

part 'custom_fields.dart';
part 'channel.dart';
part 'info.dart';
part 'message.dart';
part 'models.g.dart';
part 'permissons.dart';
part 'user.dart';
part 'user_credentials.dart';

int _tryParseInt(dynamic field) {
  if (field.runtimeType == String) {
    return int.tryParse(field);
  }
  if (field.runtimeType == int) {
    return field;
  }
  return null;
}

DateTime _fromJsonToDateTime(dynamic field) {
  if (field.runtimeType == String) {
    return DateTime.parse(field);
  }
  if (field is Map) {
    return DateTime.fromMillisecondsSinceEpoch(field['\$date'], isUtc: true);
  }
  return null;
}

Map<String, int> DateTimeToMap(DateTime dt) {
  var r = Map<String, int>();
  r["\$date"] = dt.millisecondsSinceEpoch;
  return r;
}
