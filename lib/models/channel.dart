part of models;

enum RoomType {
  channel, direct, group
}

/// The room model for RocketChat
@JsonSerializable()
class Room {
  Room();

  /// The identifier for room.
  /// 
  /// Generates by Meteor.Random() and has length equal 17.
  @JsonKey(name: '_id')
  @PrimaryKey()
  String id;

  /// The name of room (unique)
  @JsonKey(name: 'name')
  // @SqlKey(name: 'name')
  String name;

  @JsonKey(name: 'fname', includeIfNull: false)
  String fName;


  @JsonKey(name: 't')
  // @SqlKey(name: 'type', includeIfNull: false, fromJson: _fromJsonToDateTime)
  // @IgnoreColumn()
  // RoomType type;
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
  @HasOne(UserBean)
  User user;

  @JsonKey(name: 'lastMessage', includeIfNull: false)
  @IgnoreColumn()
  Message lastMessage;

  String toString() => "Room($id, $name)";

  factory Room.fromJson(Map<String, dynamic> json) =>
      _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}

@JsonSerializable()
class ChannelSubscription {
  ChannelSubscription();

  @JsonKey(name: '_id')
  @PrimaryKey()
  String id;

  @JsonKey(name: 'alert')
  bool alert;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'fname')
  @Column(name: 'display_name', isNullable: true, length: 255)
  String displayName;

  @JsonKey(name: 'open')
  bool open;

  @JsonKey(name: 'rid')
  String roomId;

  @JsonKey(name: 't')
  String type;

  @JsonKey(name: 'u')
  @IgnoreColumn()
  User user;

  @JsonKey(name: 'roles')
  @IgnoreColumn()
  List<String> roles;

  @JsonKey(name: 'unread')
  int unread;

  @JsonKey(name: 'ts', includeIfNull: false, fromJson: _fromJsonToDateTime)
  DateTime timestamp;

  @JsonKey(name: 'ls', includeIfNull: true, fromJson: _fromJsonToDateTime)
  DateTime lastSeen;

  @JsonKey(name: 'customFields', fromJson: _$CustomFieldsFromJson, toJson: _$CustomFieldsToJson)
  @IgnoreColumn()
  CustomFields customFields;

  String toString() => "ChannelSubscription($id, $name)";

  factory ChannelSubscription.fromJson(Map<String, dynamic> json) =>
      _$ChannelSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelSubscriptionToJson(this);
}
