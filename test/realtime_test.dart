import 'package:ddp/ddp.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:rocket_chat_dart/models/models.dart';
import 'package:rocket_chat_dart/realtime/client.dart';
import 'package:test/test.dart';
import 'dart:async';

void main() {
  // deploy a rocket chat server locally
  // create a user named admin with password equals to admin
  // to run this test.
  test('test realtime rocket.chat client', () async {
    Client client = Client(
        'test-1',
        Uri.parse('https://chat.apianon.ru'),
        true);
    client.addStatusListener((status) async {
      if (status == ConnectStatus.connected) {
        await client.login(UserCredentials()
          ..email = 'lyubin.p@gmail.com'
          ..password = 'apianon!123');
        
        final subscriptions = await client.getChannelSubscriptions();
        final bean = ChannelSubscriptionBean(null);
        bean.createTable();
        subscriptions.forEach((val){
          bean.insert(val);
        });
        final channels = await client.getChannelsIn();
        channels.forEach((channel) {
          client.subRoomMessages(channel.id);
        });
        client.roomMessages().listen((data) => print(data.doc));
      }
    });
    
    await Future.delayed(Duration(seconds: 29));
  });
}
