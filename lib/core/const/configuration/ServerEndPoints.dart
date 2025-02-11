extension ScopeApi on String {
  String get _api => 'api';
  String get _version => 'v1';
  String noScope() => '$_api/$this';
  String getScope() => '$_api/get/$this';
  String authScope() => '$_api/$_version/auth/$this';
  String cartScope() => '$_api/cart/$this';
  String orderScope() => '$_api/order/$this';

  String agentScope() => '$_api/agent/$this';

  String replyScope() => '$_api/order/reply/$this';
}

abstract class ServerEndPoints {
//info

static final String getInfo = 'info'.noScope();


static final String getNotifications = 'notifications'.noScope();
  
static final String getAds = 'ads'.noScope();
  
static final String updateProfile = 'update_user_data'.noScope();


  static final String addComment = 'add_comment'.noScope();

  static final String getComments = 'get_comments'.noScope();

  static final String addReport = 'add_report'.noScope();

  static final String updateOrder = 'update'.orderScope();

// remove

  static final removeSubjectFromCart = 'remove'.cartScope();

  static final finanicialAccounts = 'financial_accounts'.noScope();

  static final storeAccounts = 'store_accounts'.noScope();
  static final String getShool = 'schools'.noScope();

//

  static final String getColleges = 'colleges'.noScope();

  static final String getUniversities = 'universities'.noScope();

//
  static final String getDepartments = 'departments'.noScope();

  static final String getStages = 'stages'.noScope();

  static final String getCities = 'cities'.noScope();

  static final String getInterests = 'interests'.noScope();

  // universities

  //
//

  static final String myNotes = 'my_notes'.noScope();

  static final String retakeTest = 'retake_test'.noScope();

  static final String addNote = 'add_note'.noScope();

  static final String allQuestions = 'allQuestions'.noScope();

  static final String answerQuestion = 'answer_questions'.noScope();
  static final String getQuestions = 'get_questions'.noScope();

  static final String lectures = 'lectures'.noScope();

  static final String home = 'home'.noScope();

  static final String subjects = 'subjects'.noScope();

  //todo auth
  static final String login = 'login'.noScope();

  static final String register = 'register'.noScope();

  static final String logout = 'logout'.noScope();
}

////https://mahba.iraqtechno.com/
// 'https://mahba-iq.com'

// 
// wizariaat
abstract class ServerUrls {
  static String _baseUrlDev = 'https://wizariaat.com';

  static const String _baseUrlDevWithHttp = '';

  static String get baseUrl => _baseUrlDev;

  static String get baseUrlWithHttp => _baseUrlDevWithHttp;

  static set setBaseUri(String url) {
    _baseUrlDev = url;
  }

  static Uri get baseUri => Uri.parse(_baseUrlDev);
}
