// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _UserBean implements Bean<User> {
  final id = StrField('id');
  final name = StrField('name');
  final userName = StrField('user_name');
  final status = StrField('status');
  final token = StrField('token');
  final tokenExpires = IntField('token_expires');
  final roomId = StrField('room_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        name.name: name,
        userName.name: userName,
        status.name: status,
        token.name: token,
        tokenExpires.name: tokenExpires,
        roomId.name: roomId,
      };
  User fromMap(Map map) {
    User model = User();
    model.id = adapter.parseValue(map['id']);
    model.name = adapter.parseValue(map['name']);
    model.userName = adapter.parseValue(map['user_name']);
    model.status = adapter.parseValue(map['status']);
    model.token = adapter.parseValue(map['token']);
    model.tokenExpires = adapter.parseValue(map['token_expires']);
    model.roomId = adapter.parseValue(map['room_id']);

    return model;
  }

  List<SetColumn> toSetColumns(User model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(name.set(model.name));
      ret.add(userName.set(model.userName));
      ret.add(status.set(model.status));
      ret.add(token.set(model.token));
      ret.add(tokenExpires.set(model.tokenExpires));
      ret.add(roomId.set(model.roomId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(userName.name)) ret.add(userName.set(model.userName));
      if (only.contains(status.name)) ret.add(status.set(model.status));
      if (only.contains(token.name)) ret.add(token.set(model.token));
      if (only.contains(tokenExpires.name))
        ret.add(tokenExpires.set(model.tokenExpires));
      if (only.contains(roomId.name)) ret.add(roomId.set(model.roomId));
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
      if (model.status != null) {
        ret.add(status.set(model.status));
      }
      if (model.token != null) {
        ret.add(token.set(model.token));
      }
      if (model.tokenExpires != null) {
        ret.add(tokenExpires.set(model.tokenExpires));
      }
      if (model.roomId != null) {
        ret.add(roomId.set(model.roomId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(name.name, isNullable: false);
    st.addStr(userName.name, isNullable: false);
    st.addStr(status.name, isNullable: false);
    st.addStr(token.name, isNullable: false);
    st.addInt(tokenExpires.name, isNullable: false);
    st.addStr(roomId.name,
        foreignTable: roomBean.tableName, foreignCol: 'id', isNullable: false);
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

  Future<User> findByRoom(String roomId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.roomId.eq(roomId));
    return findOne(find);
  }

  Future<List<User>> findByRoomList(List<Room> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Room model in models) {
      find.or(this.roomId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByRoom(String roomId) async {
    final Remove rm = remover.where(this.roomId.eq(roomId));
    return await adapter.remove(rm);
  }

  void associateRoom(User child, Room parent) {
    child.roomId = parent.id;
  }

  RoomBean get roomBean;
}

abstract class _RoomBean implements Bean<Room> {
  final id = StrField('id');
  final name = StrField('name');
  final fName = StrField('f_name');
  final type = StrField('type');
  final msgs = IntField('msgs');
  final readOnly = BoolField('read_only');
  final sysMes = BoolField('sys_mes');
  final isDefault = BoolField('is_default');
  final broadcast = BoolField('broadcast');
  final timestamp = DateTimeField('timestamp');
  final updatedAt = DateTimeField('updated_at');
  final topic = StrField('topic');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        name.name: name,
        fName.name: fName,
        type.name: type,
        msgs.name: msgs,
        readOnly.name: readOnly,
        sysMes.name: sysMes,
        isDefault.name: isDefault,
        broadcast.name: broadcast,
        timestamp.name: timestamp,
        updatedAt.name: updatedAt,
        topic.name: topic,
      };
  Room fromMap(Map map) {
    Room model = Room();
    model.id = adapter.parseValue(map['id']);
    model.name = adapter.parseValue(map['name']);
    model.fName = adapter.parseValue(map['f_name']);
    model.type = adapter.parseValue(map['type']);
    model.msgs = adapter.parseValue(map['msgs']);
    model.readOnly = adapter.parseValue(map['read_only']);
    model.sysMes = adapter.parseValue(map['sys_mes']);
    model.isDefault = adapter.parseValue(map['is_default']);
    model.broadcast = adapter.parseValue(map['broadcast']);
    model.timestamp = adapter.parseValue(map['timestamp']);
    model.updatedAt = adapter.parseValue(map['updated_at']);
    model.topic = adapter.parseValue(map['topic']);

    return model;
  }

  List<SetColumn> toSetColumns(Room model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(name.set(model.name));
      ret.add(fName.set(model.fName));
      ret.add(type.set(model.type));
      ret.add(msgs.set(model.msgs));
      ret.add(readOnly.set(model.readOnly));
      ret.add(sysMes.set(model.sysMes));
      ret.add(isDefault.set(model.isDefault));
      ret.add(broadcast.set(model.broadcast));
      ret.add(timestamp.set(model.timestamp));
      ret.add(updatedAt.set(model.updatedAt));
      ret.add(topic.set(model.topic));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(fName.name)) ret.add(fName.set(model.fName));
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
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.fName != null) {
        ret.add(fName.set(model.fName));
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
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addStr(name.name, isNullable: false);
    st.addStr(fName.name, isNullable: false);
    st.addStr(type.name, isNullable: false);
    st.addInt(msgs.name, isNullable: false);
    st.addBool(readOnly.name, isNullable: false);
    st.addBool(sysMes.name, isNullable: false);
    st.addBool(isDefault.name, isNullable: false);
    st.addBool(broadcast.name, isNullable: false);
    st.addDateTime(timestamp.name, isNullable: false);
    st.addDateTime(updatedAt.name, isNullable: false);
    st.addStr(topic.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Room model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      Room newModel;
      if (model.user != null) {
        newModel ??= await find(model.id);
        userBean.associateRoom(model.user, newModel);
        await userBean.insert(model.user, cascade: cascade);
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Room> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(insert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = models
          .map((model) =>
              toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .toList();
      final InsertMany insert = inserters.addAll(data);
      await adapter.insertMany(insert);
      return;
    }
  }

  Future<dynamic> upsert(Room model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Room newModel;
      if (model.user != null) {
        newModel ??= await find(model.id);
        userBean.associateRoom(model.user, newModel);
        await userBean.upsert(model.user, cascade: cascade);
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Room> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<int> update(Room model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Room newModel;
      if (model.user != null) {
        if (associate) {
          newModel ??= await find(model.id);
          userBean.associateRoom(model.user, newModel);
        }
        await userBean.update(model.user,
            cascade: cascade, associate: associate);
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Room> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(update(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<Room> find(String id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Room model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(String id, {bool cascade = false}) async {
    if (cascade) {
      final Room newModel = await find(id);
      if (newModel != null) {
        await userBean.removeByRoom(newModel.id);
      }
    }
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

  Future<Room> preload(Room model, {bool cascade = false}) async {
    model.user =
        await userBean.findByRoom(model.id, preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Room>> preloadAll(List<Room> models,
      {bool cascade = false}) async {
    await OneToXHelper.preloadAll<Room, User>(
        models,
        (Room model) => [model.id],
        userBean.findByRoomList,
        (User model) => [model.roomId],
        (Room model, User child) => model.user = child,
        cascade: cascade);
    return models;
  }

  UserBean get userBean;
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
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(id.name, primary: true, isNullable: false);
    st.addBool(alert.name, isNullable: false);
    st.addStr(name.name, isNullable: false);
    st.addStr(displayName.name, isNullable: true);
    st.addBool(open.name, isNullable: false);
    st.addStr(roomId.name, isNullable: false);
    st.addStr(type.name, isNullable: false);
    st.addInt(unread.name, isNullable: false);
    st.addDateTime(timestamp.name, isNullable: false);
    st.addDateTime(lastSeen.name, isNullable: false);
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
