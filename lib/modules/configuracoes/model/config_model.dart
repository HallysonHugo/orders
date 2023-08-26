import 'package:isar/isar.dart';
part 'config_model.g.dart';



@collection
class ConfigModel{

  @Index(unique: true, replace: true)
  Id id = Isar.autoIncrement;
  
  String baseUrl = '';

  String porta = '3000';
  
  @enumerated
  ConnectionType connectionType = ConnectionType.http;

  bool useLocalIp = false;

  String imageLogo = "";

}

enum ConnectionType{
  http('http://'),
  https('https://');
  const ConnectionType(this.description);
  final String description;
}