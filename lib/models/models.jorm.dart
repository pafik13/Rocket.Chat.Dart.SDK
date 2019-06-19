// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _UserBean implements Bean<User> {
  final id = StrField('id');
  final name = StrField('name');
  final userName = StrField('user_name');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        name.name: name,
        userName.name: userName,
      };
  User fromMap(Map map) {
    User model = User();
    model.id = adapter.parseValue(map['id']);
    model.name = adapter.parseValue(map['name']);
    model.userName = adapter.parseValue(map['user_name']);

    return model;
  }

  List<SetColumn> toSetColumns(User model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(name.set(model.name));
      ret.add(userName.set(model.userName));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(userName.name)) ret.add(userName.set(model.userName));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.userName != null) {
        ret.add(userName.set(model.userName));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(name.name, isNullable: false);
    st.addStr(userName.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(User model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<User> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(User model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<User> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(User model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<User> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.id.eq(model.id));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<User> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(String id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<User> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }
}

abstract class _RoomBean implements Bean<Room> {
  final id = StrField('id');
  final name = StrField('name');
  final displayName = StrField('display_name');
  final type = StrField('type');
  final msgs = IntField('msgs');
  final readOnly = BoolField('read_only');
  final sysMes = BoolField('sys_mes');
  final isDefault = BoolField('is_default');
  final broadcast = BoolField('broadcast');
  final timestamp = DateTimeField('timestamp');
  final updatedAt = DateTimeField('updated_at');
  final topic = StrField('topic');
  final userId = StrField('user_id');
  final lastMessageId = StrField('last_message_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        name.name: name,
        displayName.name: displayName,
        type.name: type,
        msgs.name: msgs,
        readOnly.name: readOnly,
        sysMes.name: sysMes,
        isDefault.name: isDefault,
        broadcast.name: broadcast,
        timestamp.name: timestamp,
        updatedAt.name: updatedAt,
        topic.name: topic,
        userId.name: userId,
        lastMessageId.name: lastMessageId,
      };
  Room fromMap(Map map) {
    Room model = Room();
    model.id = adapter.parseValue(map['id']);
    model.name = adapter.parseValue(map['name']);
    model.displayName = adapter.parseValue(map['display_name']);
    model.type = adapter.parseValue(map['type']);
    model.msgs = adapter.parseValue(map['msgs']);
    model.readOnly = adapter.parseValue(map['read_only']);
    model.sysMes = adapter.parseValue(map['sys_mes']);
    model.isDefault = adapter.parseValue(map['is_default']);
    model.broadcast = adapter.parseValue(map['broadcast']);
    model.timestamp = adapter.parseValue(map['timestamp']);
    model.updatedAt = adapter.parseValue(map['updated_at']);
    model.topic = adapter.parseValue(map['topic']);
    model.userId = adapter.parseValue(map['user_id']);
    model.lastMessageId = adapter.parseValue(map['last_message_id']);

    return model;
  }

  List<SetColumn> toSetColumns(Room model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(name.set(model.name));
      ret.add(displayName.set(model.displayName));
      ret.add(type.set(model.type));
      ret.add(msgs.set(model.msgs));
      ret.add(readOnly.set(model.readOnly));
      ret.add(sysMes.set(model.sysMes));
      ret.add(isDefault.set(model.isDefault));
      ret.add(broadcast.set(model.broadcast));
      ret.add(timestamp.set(model.timestamp));
      ret.add(updatedAt.set(model.updatedAt));
      ret.add(topic.set(model.topic));
      ret.add(userId.set(model.userId));
      ret.add(lastMessageId.set(model.lastMessageId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(displayName.name))
        ret.add(displayName.set(model.displayName));
      if (only.contains(type.name)) ret.add(type.set(model.type));
      if (only.contains(msgs.name)) ret.add(msgs.set(model.msgs));
      if (only.contains(readOnly.name)) ret.add(readOnly.set(model.readOnly));
      if (only.contains(sysMes.name)) ret.add(sysMes.set(model.sysMes));
      if (only.contains(isDefault.name))
        ret.add(isDefault.set(model.isDefault));
      if (only.contains(broadcast.name))
        ret.add(broadcast.set(model.broadcast));
      if (only.contains(timestamp.name))
        ret.add(timestamp.set(model.timestamp));
      if (only.contains(updatedAt.name))
        ret.add(updatedAt.set(model.updatedAt));
      if (only.contains(topic.name)) ret.add(topic.set(model.topic));
      if (only.contains(userId.name)) ret.add(userId.set(model.userId));
      if (only.contains(lastMessageId.name))
        ret.add(lastMessageId.set(model.lastMessageId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.displayName != null) {
        ret.add(displayName.set(model.displayName));
      }
      if (model.type != null) {
        ret.add(type.set(model.type));
      }
      if (model.msgs != null) {
        ret.add(msgs.set(model.msgs));
      }
      if (model.readOnly != null) {
        ret.add(readOnly.set(model.readOnly));
      }
      if (model.sysMes != null) {
        ret.add(sysMes.set(model.sysMes));
      }
      if (model.isDefault != null) {
        ret.add(isDefault.set(model.isDefault));
      }
      if (model.broadcast != null) {
        ret.add(broadcast.set(model.broadcast));
      }
      if (model.timestamp != null) {
        ret.add(timestamp.set(model.timestamp));
      }
      if (model.updatedAt != null) {
        ret.add(updatedAt.set(model.updatedAt));
      }
      if (model.topic != null) {
        ret.add(topic.set(model.topic));
      }
      if (model.userId != null) {
        ret.add(userId.set(model.userId));
      }
      if (model.lastMessageId != null) {
        ret.add(lastMessageId.set(model.lastMessageId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(name.name, isNullable: true);
    st.addStr(displayName.name, isNullable: true);
    st.addStr(type.name, isNullable: false);
    st.addInt(msgs.name, isNullable: true);
    st.addBool(readOnly.name, isNullable: true);
    st.addBool(sysMes.name, isNullable: true);
    st.addBool(isDefault.name, isNullable: true);
    st.addBool(broadcast.name, isNullable: true);
    st.addDateTime(timestamp.name, isNullable: true);
    st.addDateTime(updatedAt.name, isNullable: false);
    st.addStr(topic.name, isNullable: true);
    st.addStr(userId.name, isNullable: false);
    st.addStr(lastMessageId.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Room model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<Room> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(Room model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<Room> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(Room model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<Room> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.id.eq(model.id));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<Room> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(String id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Room> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }
}

abstract class _ChannelSubscriptionBean implements Bean<ChannelSubscription> {
  final id = StrField('id');
  final alert = BoolField('alert');
  final name = StrField('name');
  final displayName = StrField('display_name');
  final open = BoolField('open');
  final roomId = StrField('room_id');
  final type = StrField('type');
  final unread = IntField('unread');
  final timestamp = DateTimeField('timestamp');
  final lastSeen = DateTimeField('last_seen');
  final userId = StrField('user_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        alert.name: alert,
        name.name: name,
        displayName.name: displayName,
        open.name: open,
        roomId.name: roomId,
        type.name: type,
        unread.name: unread,
        timestamp.name: timestamp,
        lastSeen.name: lastSeen,
        userId.name: userId,
      };
  ChannelSubscription fromMap(Map map) {
    ChannelSubscription model = ChannelSubscription();
    model.id = adapter.parseValue(map['id']);
    model.alert = adapter.parseValue(map['alert']);
    model.name = adapter.parseValue(map['name']);
    model.displayName = adapter.parseValue(map['display_name']);
    model.open = adapter.parseValue(map['open']);
    model.roomId = adapter.parseValue(map['room_id']);
    model.type = adapter.parseValue(map['type']);
    model.unread = adapter.parseValue(map['unread']);
    model.timestamp = adapter.parseValue(map['timestamp']);
    model.lastSeen = adapter.parseValue(map['last_seen']);
    model.userId = adapter.parseValue(map['user_id']);

    return model;
  }

  List<SetColumn> toSetColumns(ChannelSubscription model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(alert.set(model.alert));
      ret.add(name.set(model.name));
      ret.add(displayName.set(model.displayName));
      ret.add(open.set(model.open));
      ret.add(roomId.set(model.roomId));
      ret.add(type.set(model.type));
      ret.add(unread.set(model.unread));
      ret.add(timestamp.set(model.timestamp));
      ret.add(lastSeen.set(model.lastSeen));
      ret.add(userId.set(model.userId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(alert.name)) ret.add(alert.set(model.alert));
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(displayName.name))
        ret.add(displayName.set(model.displayName));
      if (only.contains(open.name)) ret.add(open.set(model.open));
      if (only.contains(roomId.name)) ret.add(roomId.set(model.roomId));
      if (only.contains(type.name)) ret.add(type.set(model.type));
      if (only.contains(unread.name)) ret.add(unread.set(model.unread));
      if (only.contains(timestamp.name))
        ret.add(timestamp.set(model.timestamp));
      if (only.contains(lastSeen.name)) ret.add(lastSeen.set(model.lastSeen));
      if (only.contains(userId.name)) ret.add(userId.set(model.userId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.alert != null) {
        ret.add(alert.set(model.alert));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.displayName != null) {
        ret.add(displayName.set(model.displayName));
      }
      if (model.open != null) {
        ret.add(open.set(model.open));
      }
      if (model.roomId != null) {
        ret.add(roomId.set(model.roomId));
      }
      if (model.type != null) {
        ret.add(type.set(model.type));
      }
      if (model.unread != null) {
        ret.add(unread.set(model.unread));
      }
      if (model.timestamp != null) {
        ret.add(timestamp.set(model.timestamp));
      }
      if (model.lastSeen != null) {
        ret.add(lastSeen.set(model.lastSeen));
      }
      if (model.userId != null) {
        ret.add(userId.set(model.userId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addBool(alert.name, isNullable: false);
    st.addStr(name.name, isNullable: false);
    st.addStr(displayName.name, length: 255, isNullable: true);
    st.addBool(open.name, isNullable: false);
    st.addStr(roomId.name, isNullable: false);
    st.addStr(type.name, isNullable: false);
    st.addInt(unread.name, isNullable: false);
    st.addDateTime(timestamp.name, isNullable: false);
    st.addDateTime(lastSeen.name, isNullable: true);
    st.addStr(userId.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(ChannelSubscription model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<ChannelSubscription> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(ChannelSubscription model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<ChannelSubscription> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(ChannelSubscription model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<ChannelSubscription> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.id.eq(model.id));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<ChannelSubscription> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(String id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<ChannelSubscription> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }
}

abstract class _CustomFieldsBean implements Bean<CustomFields> {
  final anonymId = IntField('anonym_id');
  final photoUrl = StrField('photo_url');
  final registeredAt = StrField('registered_at');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        anonymId.name: anonymId,
        photoUrl.name: photoUrl,
        registeredAt.name: registeredAt,
      };
  CustomFields fromMap(Map map) {
    CustomFields model = CustomFields();
    model.anonymId = adapter.parseValue(map['anonym_id']);
    model.photoUrl = adapter.parseValue(map['photo_url']);
    model.registeredAt = adapter.parseValue(map['registered_at']);

    return model;
  }

  List<SetColumn> toSetColumns(CustomFields model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(anonymId.set(model.anonymId));
      ret.add(photoUrl.set(model.photoUrl));
      ret.add(registeredAt.set(model.registeredAt));
    } else if (only != null) {
      if (only.contains(anonymId.name)) ret.add(anonymId.set(model.anonymId));
      if (only.contains(photoUrl.name)) ret.add(photoUrl.set(model.photoUrl));
      if (only.contains(registeredAt.name))
        ret.add(registeredAt.set(model.registeredAt));
    } else /* if (onlyNonNull) */ {
      if (model.anonymId != null) {
        ret.add(anonymId.set(model.anonymId));
      }
      if (model.photoUrl != null) {
        ret.add(photoUrl.set(model.photoUrl));
      }
      if (model.registeredAt != null) {
        ret.add(registeredAt.set(model.registeredAt));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(anonymId.name, isNullable: false);
    st.addStr(photoUrl.name, isNullable: false);
    st.addStr(registeredAt.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(CustomFields model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<CustomFields> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(CustomFields model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<CustomFields> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<void> updateMany(List<CustomFields> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(null);
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }
}
