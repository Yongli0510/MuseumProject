var isEmail = /^([a-z0-9A-Z]+[-|.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\.)+[a-zA-Z]{2,}$/;
var isPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,10}$/;

/*Check whether the element is empty*/
var checkEmpty = function (val) {
    return val == null || val.length <= 0;
};
/*Check whether the name exist*/
var checkNameValid = function (val) {
    var str = $.trim(val);
    if (str.length >= 4 && str.length <= 15)
        return true;//TODO:link to database to judge
    return false;
};

var checkEmailValid = function (val) {
    var email = $.trim($('#sign_mail').val());
    return isEmail.test(email);
};