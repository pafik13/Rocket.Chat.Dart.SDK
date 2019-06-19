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

  /// The name of room (unique & nullable)
  /// 
  /// When t:d -> empty
  @JsonKey(name: 'name')
  @Column(isNullable: true)
  String name;

  /// The name for display (nullable)
  @JsonKey(name: 'fname', includeIfNull: false)
  @Column(isNullable: true)
  String displayName;

  /// The type of room ('c', 'g', 'd')
  @JsonKey(name: 't')
  // @SqlKey(name: 'type', includeIfNull: false, fromJson: _fromJsonToDateTime)
  // @IgnoreColumn()
  // RoomType type;
  String type;

  /// Messages Counter
  @JsonKey(name: 'msgs')
  int messagesCount;

  /// True if only authorized users can write new messages
  @JsonKey(name: 'ro', includeIfNull: false)
  @Column(isNullable: true)
  bool isReadOnly;

  @JsonKey(name: 'sysMes', includeIfNull: false)
  @Column(isNullable: true)
  bool hasSystemMessage;

  /// True if room has autosubscription
  @JsonKey(name: 'default')
  @Column(isNullable: true)
  bool isDefault;

  /// True if only authorized users can write new messages, but the other users will be able to reply
  @JsonKey(name: 'broadcast', includeIfNull: false)
  @Column(isNullable: true)
  bool isBroadcast;

  /// True if
  @JsonKey(name: 'encrypted', includeIfNull: false)
  @Column(isNullable: true)
  bool isEncrypted;

  /// True if
  @JsonKey(name: 'muted', includeIfNull: false)
  @Column(isNullable: true)
  bool isMuted;

  @JsonKey(name: 'ts', includeIfNull: false, fromJson: _fromJsonToDateTime)
  DateTime createdAt;

  @JsonKey(name: '_updatedAt', includeIfNull: false, fromJson: _fromJsonToDateTime)
  DateTime updatedAt;

  @JsonKey(name: 'topic')
  @Column(isNullable: true)
  String topic;

  @JsonKey(name: 'description')
  @Column(isNullable: true)
  String description;

  @JsonKey(name: 'announcement')
  @Column(isNullable: true)
  String announcement;

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

  /// The owner
  @JsonKey(name: 'u', includeIfNull: false)
  @IgnoreColumn()
  User user;

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

  /// The last message in room
  @JsonKey(name: 'lastMessage', includeIfNull: false)
  @IgnoreColumn()
  Message lastMessage;

  @JsonKey(name: 'lm', includeIfNull: false, fromJson: _fromJsonToDateTime)
  @Column(isNullable: true)
  DateTime lastMessageTimestamp;

  String toString() => "Room($id, $name)";

  factory Room.fromJson(Map<String, dynamic> json) =>
      _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}

