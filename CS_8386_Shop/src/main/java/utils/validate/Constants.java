package utils.validate;

public class Constants {
    //login google
    public static String GOOGLE_CLIENT_ID = "918294539710-o1ifsiv5u4ugolgnhl32m7q9hnqonuqe.apps.googleusercontent.com";

    public static String GOOGLE_CLIENT_SECRET = "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";

    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/logingoogleservlet";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";
    public static final String GOOGLE_SCOPE = "https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email";

    // login facebook
    public static final String FACEBOOK_CLIENT_ID = "667150702479237";
    public static final String FACEBOOK_CLIENT_SECRET = "c10388d83a8b00bd527bb6a3d7e30b5b";
    public static final String FACEBOOK_REDIRECT_URI = "http://localhost:8080/loginfacebookservlet";
    public static final String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/v19.0/oauth/access_token";
    public static final String FACEBOOK_LINK_GET_USER_INFO = "https://graph.facebook.com/me?fields=id,name,email,picture&access_token=";

}
