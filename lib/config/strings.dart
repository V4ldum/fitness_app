class Strings {
  Strings._();

  //Errors
  static const String loginErrorHeader =
      "Nom d'utilisateur ou mot de passe incorrect";
  static const String loginErrorBody =
      "Le nom d'utilisateur ou mot de passe saisi est incorrect.";
  static const String networkErrorHeader = "Erreur réseau";
  static const String networkErrorBody =
      "La connexion ne peut pas être établie avec le serveur.";
  static const String connectionErrorHeader = "Connexion impossible";
  static const String connectionErrorBody =
      "Vérifie que tu as accès à Internet avant de rafraichir la page.";
  static const String videoErrorHeader = "Vidéo inaccessible";
  static const String videoErrorBody =
      "Vérifie ta connexion à Internet. Si le problème persiste, contacte l'administrateur.";

  static const String refreshButton = "Rafraichir";
  static const String loginAlertButton = "OK";

  //AppBar
  static const String appBarWeek = "Programme de la semaine";
  static const String appBarPreview = "Demonstration";
  static const String appBarProfile = "Mon Profile";

  //Login
  static const String loginPageTitle = "Connecte toi";
  static const String loginHint = "Nom d'utilisateur";
  static const String passwordHint = "Mot de passe";
  static const String signUpButton = "S'inscrire";
  static const String logInButton = "Se connecter";
  static const String forgottenPassword = "Mot de passe oublié";
  static const String forgottenPasswordHost = "i.imgflip.com";
  static const String forgottenPasswordPath = "2mskjg.jpg";
  static const String createAccountHost = "i.imgflip.com";
  static const String createAccountPath = "2mskjg.jpg";

  //Profile
  static const String logOutMessage =
      "Êtes-vous sûr de vouloir vous déconnecter ?";
  static const String logOutAccept = "Se déconnecter";
  static const String logOutDeny = "Annuler";
  static const String parametersTitle = "Paramètres";
  static const String myAccountButton = "Mon Compte";
  static const String notificationsSettings = "Notifications";
  static const String deviceSettingsButton = "Paramètres de l'appareil";
  static const String myAccountHost = "i.imgflip.com";
  static const String myAccountPath = "2mskjg.jpg";

  //Shared Preferences
  static const String notificationSettingKey = "notifications";
  //API
  static const String apiHost = "localhost:8000";
  static const String apiAuthPath = "/user/auth";
  static const String apiAccessPath = "/user/access";
  static const String apiRefreshPath = "/user/refesh";
  static const String apiPicturePath = "/user/picture";
  static const String apiDailyPath = "/daily";
  static const String apiDailyAssetsPath = "/daily/asset";
}