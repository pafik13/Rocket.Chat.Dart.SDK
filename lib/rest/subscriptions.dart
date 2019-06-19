part of rest;

abstract class _ClientSubscriptionsMixin implements _ClientWrapper {
  Future<List<Subscription>> getSubscriptions() {
    Completer<List<Subscription>> completer = Completer();
    http.get('${_getUrl()}/subscriptions.get', headers: {
      'X-User-Id': _auth._id,
      'X-Auth-Token': _auth._token,
    }).then((response) {
      _hackResponseHeader(response);
      final rawRoomsList = json.decode(response.body)['update'] as List;
      final rooms = <Subscription>[];
      for (var raw in rawRoomsList) {
        rooms.add(Subscription.fromJson(raw));
      }
      completer.complete(rooms);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  Future<Subscription> getSubscriptionsOne(String roomId) {
    Completer<Subscription> completer = Completer();
    http.get('${_getUrl()}/subscriptions.getOne?roomId=$roomId', headers: {
      'X-User-Id': _auth._id,
      'X-Auth-Token': _auth._token,
    }).then((response) {
      _hackResponseHeader(response);
      final rawBody = json.decode(response.body)['subscription'];
      if (rawBody == null) {
        completer.complete(null);
      } else {
        final subscription = Subscription.fromJson(rawBody);
        completer.complete(subscription);
      }
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  Future<void> markAsRead(String rid) {
    Completer<void> completer = Completer();
    http
        .post('${_getUrl()}/subscriptions.read',
            headers: {
              'X-User-Id': _auth._id,
              'X-Auth-Token': _auth._token,
              'Content-Type': 'application/json',
            },
            body: json.encode(<String, String>{'rid': rid}))
        .then((response) => completer.complete(null))
        .catchError((error) => completer.completeError(error));
    return completer.future;
  }
}
