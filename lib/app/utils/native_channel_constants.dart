class FlutterPlatformChannels {
  static const mainChannel = "backstage.flutter/main";
  static const splashChannel = "backstage.flutter/splash";
  static const authChannel = "backstage.flutter/auth";
  static const eventsChannel = "backstage.flutter/events";
  static const transactionsChannel = 'backstage.flutter/transactions';
  static const profileChannel = 'backstage.flutter/profile';
  static const reportsChannel = 'backstage.flutter/reports';
}

class FlutterPlatformMethods {
  static const changeClientEnvironment = 'changeEnvironment';
  static const changeAppLanguage = 'changeAppLanguage';
  static const getNativeAppLanguage = 'getNativeAppLanguage';
  static const getUserInfo = 'getUserInfo';
  static const updateUserInfo = 'updateUserInfo';
  static const goToLogin = 'goToLogin';
  static const goToHome = 'goToHome';
  static const sendUserData = 'sendUserData';
  static const saveEventId = 'eventId';
  static const popPage = 'popPage';
  static const canNativeBack = 'canNativeBack';
  static const updateAuthToken = 'updateAuthToken';

  static const openEditProducerData = 'openEditProducerData';
  static const openEditPOSData = 'openEditPOSData';
  static const openSecurityKey = 'openSecurityKey';
  static const openPOSTransactions = 'openPOSTransactions';
  static const openEntrance = 'openEntrance';
  static const openPos = 'openPos';
  static const openTransactionReport = 'openTransactionReport';
  static const openSalesReport = 'openSalesReport';
  static const openVisitsReport = 'openVisitsReport';
  static const openEntranceReport = 'openEntranceReport';
  static const openPreValidation = 'openPreValidation';
  static const printCashClosing = 'printCashClosing';
  static const openHelp = 'openHelp';
  static const logout = 'logout';
  static const backToHome = 'backToHome';
  static const sendNewPicture = 'sendNewPicture';
  static const changeProducerPicture = 'changeProducerPicture';
}
