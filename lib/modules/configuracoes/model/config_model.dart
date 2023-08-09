import 'package:isar/isar.dart';
part 'config_model.g.dart';



@collection
class ConfigModel{

  @Index(unique: true, replace: true)
  Id id = Isar.autoIncrement;
  
  String baseUrl = '';
  
  @enumerated
  ConnectionType connectionType = ConnectionType.http;

  bool useLocalIp = false;

  String imageLogo = "";
}

enum ConnectionType{
  http,
  https
}
extension ConnectionTypeExtension on ConnectionType{
  String get name{
    switch(this){
      case ConnectionType.http:
        return 'http://';
      case ConnectionType.https:
        return 'https://';
    }
  }
}