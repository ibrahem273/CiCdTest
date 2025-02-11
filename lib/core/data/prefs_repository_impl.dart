import 'package:shared_preferences/shared_preferences.dart';
import 'package:pos_app/core/const/configuration/prefs_key.dart';
import 'package:pos_app/core/domain/prefs_repository.dart';

class PrefsRepositoryImpl extends PrefsRepository {
  final SharedPreferences _preferences;

  PrefsRepositoryImpl(this._preferences);

  @override
  String? get serverToken => _preferences.getString(PrefsKey.serverToken);

  @override
  Future<bool> removeServerToken() {
    return _preferences.remove(PrefsKey.serverToken);
  }

  @override
  Future<bool> setServerToken(String token) {
    return _preferences.setString(PrefsKey.serverToken, token);
  }

  @override
  Future<bool> setProfilePhoto(String profilePhoto) {
    return _preferences.setString(PrefsKey.profilePhoto, profilePhoto);
  }

  @override
  Future<bool> setShowSplash(bool value) {
    return _preferences.setBool(PrefsKey.showSplash, value);
  }

  @override
  bool? get getNotFirstTimeOpeningApp =>
      _preferences.getBool(PrefsKey.notFirstTimeOpeningApp);

  @override
  String? get getUserName => _preferences.getString(PrefsKey.userName);

  @override
  String? get email => _preferences.getString(PrefsKey.email);

  @override
  String? get getTest => _preferences.getString('test');

  @override
  Future<bool> setUserName(String value) {
    return _preferences.setString(PrefsKey.userName, value);
  }

  @override
  Future<bool> setNotFirstTimeOpeningApp(bool notFirstTimeOpeningApp) {
    return _preferences.setBool(
        PrefsKey.notFirstTimeOpeningApp, notFirstTimeOpeningApp);
  }

  @override
  Future<bool> setEmail(String email) {
    return _preferences.setString(PrefsKey.email, email);
  }

  @override
  Future<bool> setIsOwner(bool email) {
    return _preferences.setBool(PrefsKey.isOwner, email);
  }

  @override
  String? get fcmToken => _preferences.getString(PrefsKey.fcmToken);

  @override
  int? get getCurrentClientId =>
      _preferences.getInt(PrefsKey.currentClientUserId);

  @override
  int? get getCurrentGroupLeaderId =>
      _preferences.getInt(PrefsKey.currentGroupLeaderUserId);

  @override
  int? get getCurrentTeamLeadersId =>
      _preferences.getInt(PrefsKey.currentTeamLeadersUserId);

  @override
  int? get getCurrentTeamsLeadersId =>
      _preferences.getInt(PrefsKey.currentTeamsLeadersUserId);

  @override
  Future<bool> setFcmToken(String fcmToken) {
    return _preferences.setString(PrefsKey.fcmToken, fcmToken);
  }

  @override
  String? get getProfilePhoto => _preferences.getString(PrefsKey.profilePhoto);

  @override
  bool? get getIsOwner => _preferences.getBool(PrefsKey.isOwner);

  @override
  String? get getMobileNumber => _preferences.getString(PrefsKey.mobileNumber);

  @override
  Future<bool> setMobileNumber(String mobileNumber) {
    return _preferences.setString(PrefsKey.mobileNumber, mobileNumber);
  }

  @override
  Future<bool> setUserType(String userType) {
    return _preferences.setString(PrefsKey.userType, userType);
  }

  @override
  Future<bool> setCurrentClientId(int clientUserId) {
    return _preferences.setInt(PrefsKey.currentClientUserId, clientUserId);
  }

  @override
  Future<bool> setCurrentGroupLeadertId(int groupLeaderUserId) {
    return _preferences.setInt(
        PrefsKey.currentGroupLeaderUserId, groupLeaderUserId);
  }

  @override
  Future<bool> setCurrentTeamLeadersId(int teamLeadersUserId) {
    return _preferences.setInt(
        PrefsKey.currentTeamLeadersUserId, teamLeadersUserId);
  }

  @override
  Future<bool> setCurrentTeamsLeadersId(int teamLeadersUserId) {
    return _preferences.setInt(
        PrefsKey.currentTeamsLeadersUserId, teamLeadersUserId);
  }

  @override
  int? get numberOfSalePoints =>
      _preferences.getInt(PrefsKey.numberOfSalePoints);

  @override
  Future<bool> setNumberOfSalePoints(int numberOfSalePoints) {
    return _preferences.setInt(PrefsKey.numberOfSalePoints, numberOfSalePoints);
  }

  @override
  Future<bool> seturlPhoto(String urlPhoto) {
    return _preferences.setString(PrefsKey.profilePhoto, urlPhoto);
  }

  @override
  String? get urlPhoto => _preferences.getString(PrefsKey.profilePhoto);

  @override
  String? get language => _preferences.getString(PrefsKey.language);

  @override
  Future<bool> setLanguage(String language) {
    return _preferences.setString(PrefsKey.profilePhoto, language);
  }

  @override
  Future<bool> setTest(String test) {
    return _preferences.setString('test', test);
  }

  @override
  Future<bool> setUserId(int value) =>
      _preferences.setInt(PrefsKey.userId, value);

  @override
  int? get getUserId => _preferences.getInt(PrefsKey.userId);

  @override
  String? get getUserType => _preferences.getString(PrefsKey.userType);

  @override
  String? get phoneNumber => _preferences.getString(PrefsKey.phoneNumber);

  @override
  Future<bool> setPhoneNumber(String phoneNumber) {
    // PrefsKey.phoneNumber
    return _preferences.setString(PrefsKey.phoneNumber, phoneNumber);
  }

  @override
  Future<bool> setWhatsAppNumber(String whatsAppNumber) {
    return _preferences.setString(PrefsKey.whastAppNumber, whatsAppNumber);
  }

  @override
  String? get whatsAppNumber => _preferences.getString(PrefsKey.whastAppNumber);

  @override
  String? get getAccountInfo => _preferences.getString(PrefsKey.accountInfo);

  @override
  Future<bool> setAccountInfo(String accountInfo) {
    return _preferences.setString(PrefsKey.accountInfo, accountInfo);
  }
}
