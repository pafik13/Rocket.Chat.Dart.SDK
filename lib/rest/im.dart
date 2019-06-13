part of rest;

abstract class _ClientIMMixin implements _ClientWrapper {
  Future<List<Message>> loadIMHistory(
    String roomId, {
    DateTime latest,
    DateTime oldest,
    bool inclusive,
    int count,
    bool unreads,
  }) {
    Completer<List<Message>> completer = Completer();
    StringBuffer query = StringBuffer('roomId=$roomId');
    if (latest != null) {
      query.write('&latest=${latest.toUtc().toIso8601String()}');
    }
    if (oldest != null) {
      query.write('&oldest=${oldest.toUtc().toIso8601String()}');
    }
    if (inclusive != null) {
      query.write('&inclusive=$inclusive');
    }
    if (count != null) {
      query.write('&count=$count');
    }
    if (unreads != null) {
      query.write('&unreads=$unreads');
    }
    http.get('${_getUrl()}/im.history?${query.toString()}', headers: {
      'X-User-Id': _auth._id,
      'X-Auth-Token': _auth._token,
    }).then((response) {
      _hackResponseHeader(response);
      final raws = json.decode(response.body)['messages'];
      final results = <Message>[];
      for (var raw in raws) {
        results.add(Message.fromJson(raw));
      }
      completer.complete(results);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  Future<Room> createIM(String username) {
    Completer<Room> completer = Completer();
    http
        .post('${_getUrl()}/im.create',
            headers: {
              'X-User-Id': _auth._id,
              'X-Auth-Token': _auth._token,
              'Content-Type': 'application/json',
            },
            body: json.encode(<String, String>{
              'username': username,
            }))
        .then((response) {
      _hackResponseHeader(response);
      final channel = Room.fromJson(json.decode(response.body)['room']);
      completer.complete(channel);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  Future<List<Room>> listIMs() {
    Completer<List<Room>> completer = Completer();
    http.get('${_getUrl()}/im.list', headers: {
      'X-User-Id': _auth._id,
      'X-Auth-Token': _auth._token,
    }).then((response) {
      _hackResponseHeader(response);
      final ims = json.decode(response.body)['ims'] as List;
      final list = ims.map<Room>((im) => Room.fromJson(im)).toList();
      completer.complete(list);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }
}
