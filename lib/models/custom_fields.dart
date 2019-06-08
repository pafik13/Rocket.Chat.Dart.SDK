part of models;

@JsonSerializable()
class CustomFields {
  CustomFields();

  @JsonKey(name: 'anonym_id', fromJson: _tryParseInt)
  int anonymId;

  @JsonKey(name: 'photoUrl')
  String photoUrl;

  @JsonKey(name: 'registeredAt')
  String registeredAt;

  factory CustomFields.fromJson(Map<String, dynamic> json) =>
      _$CustomFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomFieldsToJson(this);
}
