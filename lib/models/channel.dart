part of models;

@JsonSerializable()
class Room {
  Room();

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'fname', includeIfNull: false)
  String fName;

  @JsonKey(name: 't')
  String type;

  @JsonKey(name: 'msgs')
  int msgs;

  @JsonKey(name: 'ro', includeIfNull: false)
  bool readOnly;

  @JsonKey(name: 'sysMes', includeIfNull: false)
  bool sysMes;

  @JsonKey(name: 'default')
  bool isDefault;

  @JsonKey(name: 'broadcast', includeIfNull: false)
  bool broadcast;

  @JsonKey(name: 'ts', includeIfNull: false, fromJson: _fromJsonToDateTime)
  DateTime timestamp;

  @JsonKey(name: '_updatedAt', includeIfNull: false,fromJson: _fromJsonToDateTime)
  DateTime updatedAt;

  @JsonKey(name: 'topic')
  String topic;

  @JsonKey(name: 'u', includeIfNull: false)
  User user;

  @JsonKey(name: 'lastMessage', includeIfNull: false)
  Message lastMessage;

  factory Room.fromJson(Map<String, dynamic> json) =>
      _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}

@JsonSerializable()
class ChannelSubscription {
  ChannelSubscription();

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'alert')
  bool alert;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'fname')
  String displayName;

  @JsonKey(name: 'open')
  bool open;

  @JsonKey(name: 'rid')
  String roomId;

  @JsonKey(name: 't')
  String type;

  @JsonKey(name: 'u')
  User user;

  @JsonKey(name: 'roles')
  List<String> roles;

  @JsonKey(name: 'unread')
  int unread;

  @JsonKey(name: 'ts', includeIfNull: false, fromJson: _fromJsonToDateTime)
  DateTime timestamp;

  @JsonKey(name: 'ls', includeIfNull: true, fromJson: _fromJsonToDateTime)
  DateTime lastSeen;

  @JsonKey(name: 'customFields', fromJson: _$CustomFieldsFromJson, toJson: _$CustomFieldsToJson)
  CustomFields customFields;

  factory ChannelSubscription.fromJson(Map<String, dynamic> json) =>
      _$ChannelSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelSubscriptionToJson(this);
}
