import java.util.regex.Pattern;

/*Must assure the strings are not null*/
public class SignChecker {

    private static final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
    private static final String REGEX_NAME = "^{4,15}$";
    private static final String REGEX_PWD = "^[a-zA-Z0-9]{6,10}$";


    /*Return true if string is not empty*/
    public boolean check_not_empty(String str) {
        return !str.isEmpty();
    }

    public boolean check_mail(String str) {
        return Pattern.matches(REGEX_EMAIL, str);
    }

    public boolean check_second_pwd(String str1, String str2) {
        return str1.equals(str2);
    }

    public boolean check_name_standard(String str) {
        return Pattern.matches(REGEX_NAME, str);
    }

    public boolean check_name_not_exist(String str) {
        return true;//TODO:link to database to judge
    }

    public boolean check_pwd_standard(String str) {
        return Pattern.matches(REGEX_PWD, str);
    }


}
