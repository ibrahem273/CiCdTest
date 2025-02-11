import 'package:get_it/get_it.dart';
import 'package:pos_app/core/const/configuration/ServerEndPoints.dart';
import 'package:pos_app/core/domain/prefs_repository.dart';

enum ServerName { basicServer }

//todo make the return value dynamic to return the cloudinary as String
Uri getBaseUriForSpecificServer(ServerName serverName) {
  switch (serverName) {
    case ServerName.basicServer:
      return ServerUrls.baseUri;
  }
}

String? getServerToken(ServerName serverName) {
  final PrefsRepository prefsRepository = GetIt.I<PrefsRepository>();
  switch (serverName) {
    // case ServerName.chat : return  prefsRepository.chatToken;
    // case ServerName.market : return  prefsRepository.marketToken;
    // case ServerName.stories : return prefsRepository.storiesToken;
    // case ServerName.location : return null ;
    case ServerName.basicServer:
      return prefsRepository.serverToken;
  }
}
