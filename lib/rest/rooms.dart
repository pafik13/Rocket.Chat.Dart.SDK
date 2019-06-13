part of rest;

abstract class _ClientRoomsMixin implements _ClientWrapper {
  Future<List<Room>> getRooms() {
    Completer<List<Room>> completer = Completer();
    http.get('${_getUrl()}/rooms.get', headers: {
      'X-User-Id': _auth._id,
      'X-Auth-Token': _auth._token,
    }).then((response) {
      _hackResponseHeader(response);
      final rawRoomsList = json.decode(response.body)['update'] as List;
      final rooms = <Room>[];
      for (var raw in rawRoomsList) {
        rooms.add(Room.fromJson(raw));
      }
      completer.complete(rooms);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }
}
