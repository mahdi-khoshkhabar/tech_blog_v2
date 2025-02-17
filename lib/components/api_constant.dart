class ApiConstant {
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const postRegister = "${baseUrl}register/action.php";
  static const postVerify = postRegister;
  static const getHomItems = "${baseUrl}home/?command=index";
  static const hostDlUrl = "https://techblog.sasansafari.com";
  static const getArticleList =
      "${baseUrl}article/get.php?command=new&user_id=";
  static const getPodcastList =
      "${baseUrl}podcast/get.php?command=new&user_id=";
}
