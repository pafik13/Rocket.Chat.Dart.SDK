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
  @Column(isNullable: true)
  String name;

  @JsonKey(name: 'fname', includeIfNull: false)
  @Column(isNullable: true)
  String fName;


  @JsonKey(name: 't')
  // @SqlKey(name: 'type', includeIfNull: false, fromJson: _fromJsonToDateTime)
  // @IgnoreColumn()
  // RoomType type;
  String type;

  @JsonKey(name: 'msgs')
  @Column(isNullable: true)
  int msgs;

  @JsonKey(name: 'ro', includeIfNull: false)
  @Column(isNullable: true)
  bool readOnly;

  @JsonKey(name: 'sysMes', includeIfNull: false)
  @Column(isNullable: true)
  bool sysMes;

  @JsonKey(name: 'default')
  @Column(isNullable: true)
  bool isDefault;

  @JsonKey(name: 'broadcast', includeIfNull: false)
  @Column(isNullable: true)
  bool broadcast;

  @JsonKey(name: 'ts', includeIfNull: false, fromJson: _fromJsonToDateTime)
  @Column(isNullable: true)
  DateTime timestamp;

  @JsonKey(name: '_updatedAt', includeIfNull: false,fromJson: _fromJsonToDateTime)
  DateTime updatedAt;

  @JsonKey(name: 'topic')
  @Column(isNullable: true)
  String topic;

  /// The User
  @JsonKey(ignore: true)
  @Column(isNullable: true, length: 17)
  String get userId {
    return user?.id;
  }
  void set userId(String str) {
    if (user != null) throw Exception('user must be null');
    user = User()
      ..id = str;
  }

  @JsonKey(name: 'u', includeIfNull: false)
  @IgnoreColumn()
  User user;

  /// The LastMessage
  @JsonKey(ignore: true)
  @Column(isNullable: true, length: 32)
  String get lastMessageId {
    return lastMessage?.id;
  }
  void set lastMessageId(String str) {
    if (lastMessage != null) throw Exception('lastMessage must be null');
    lastMessage = Message()
      ..id = str;
  }

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

  /// The User
  @JsonKey(ignore: true)
  @Column(isNullable: true, length: 17)
  String get userId {
    return user?.id;
  }
  void set userId(String str) {
    if (user != null) throw Exception('user must be null');
    user = User()
      ..id = str;
  }
  
  @JsonKey(ignore: true)
  @IgnoreColumn()
  bool get isUserReady {
    return user != null && !isNullOrEmtpy(user.id) && !isNullOrEmtpy(user.userName);
  }

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
  @Column(isNullable: true)
  DateTime lastSeen;

  @JsonKey(name: 'customFields', fromJson: _$CustomFieldsFromJson, toJson: _$CustomFieldsToJson)
  @IgnoreColumn()
  CustomFields customFields;

  String toString() => "ChannelSubscription($id, $name)";

  factory ChannelSubscription.fromJson(Map<String, dynamic> json) =>
      _$ChannelSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelSubscriptionToJson(this);
}
