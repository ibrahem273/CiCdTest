abstract class PrefsRepository {
  
  
  String? get getAccountInfo;
  int? get getCurrentClientId;
  int? get getCurrentGroupLeaderId;

  int? get getCurrentTeamLeadersId;
  int? get getCurrentTeamsLeadersId;

  String? get serverToken;
  int? get numberOfSalePoints;

  String? get phoneNumber;
  String? get whatsAppNumber;


  String? get urlPhoto;
  String? get fcmToken;
  String? get getProfilePhoto;
  String? get email;
  String? get getUserName;
  String? get getMobileNumber;
  bool? get getNotFirstTimeOpeningApp;
  String? get language;
  String? get getTest;
  String? get getUserType;

  bool? get getIsOwner;

  Future<bool> setWhatsAppNumber(String whatsAppNumber);
  Future<bool> setPhoneNumber(String phoneNumber);


Future<bool>  setAccountInfo(String accountInfo);

//


  Future<bool> setIsOwner(bool isOwner);

  int? get getUserId;

  Future<bool> setLanguage(String language);

  Future<bool> setCurrentClientId(int clientUserId);
  Future<bool> setCurrentGroupLeadertId(int groupLeaderUserId);
  Future<bool> setCurrentTeamLeadersId(int teamLeadersUserId);
  Future<bool> setCurrentTeamsLeadersId(int teamLeadersUserId);

  Future<bool> seturlPhoto(String token);

  Future<bool> setNumberOfSalePoints(int numberOfSalePoints);

  Future<bool> setMobileNumber(String mobileNumber);
  Future<bool> setFcmToken(String fcmToken);
  Future<bool> setProfilePhoto(String profilePhoto);
  Future<bool> setNotFirstTimeOpeningApp(bool notFirstTimeOpeningApp);

  Future<bool> removeServerToken();
  Future<bool> setServerToken(String token);
  Future<bool> setEmail(String email);

  Future<bool> setUserType(String email);

  Future<bool> setTest(String test);

  Future<bool> setShowSplash(bool value);
  Future<bool> setUserName(String value);

  Future<bool> setUserId(int value);
}
