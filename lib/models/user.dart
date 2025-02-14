part of models;

@JsonSerializable()
class User {
  User();

  @JsonKey(name: '_id')
  @PrimaryKey()
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'username')
  String userName;

  @JsonKey(name: 'customFields')
  @IgnoreColumn()
  CustomFields customFields;

  @JsonKey(name: 'status')
  @IgnoreColumn()
  String status;

  @JsonKey(name: 'token')
  @IgnoreColumn()
  String token;

  @JsonKey(name: 'tokenExpires')
  @IgnoreColumn()
  int tokenExpires;

  // @BelongsTo(RoomBean)
  // String roomId;

  String toString() => "User($id, $name)";

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UsernameAndId {
  UsernameAndId();

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'username')
  String userName;

  factory UsernameAndId.fromJson(Map<String, dynamic> json) => _$UsernameAndIdFromJson(json);

  Map<String, dynamic> toJson() => _$UsernameAndIdToJson(this);
}
