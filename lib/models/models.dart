library models;

import 'package:json_annotation/json_annotation.dart';
import 'package:jaguar_orm/jaguar_orm.dart';

part 'custom_fields.dart';
part 'channel.dart';
part 'info.dart';
part 'message.dart';
part 'models.g.dart';
part 'models.jorm.dart';
part 'permissons.dart';
part 'user.dart';
part 'user_credentials.dart';

bool isNullOrEmtpy(String str){
   return str == null || str == "";
}

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


/// Bean logic is generated by Jaguar ORM
@GenBean()
class UserBean extends Bean<User> with _UserBean {
  UserBean(Adapter adapter) : super(adapter);

  String get tableName => 'users';
}

@GenBean()
class RoomBean extends Bean<Room> with _RoomBean {
  RoomBean(Adapter adapter) : super(adapter);

  String get tableName => 'rooms';
}

@GenBean()
class ChannelSubscriptionBean extends Bean<ChannelSubscription> with _ChannelSubscriptionBean {
  ChannelSubscriptionBean(Adapter adapter) : super(adapter);

  String get tableName => 'subscriptions';
}
