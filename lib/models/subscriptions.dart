
part of models;

@JsonSerializable()
class Subscription {
  Subscription();

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

  String toString() => "Subscription($id, $name)";

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}