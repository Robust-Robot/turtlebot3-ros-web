var myLocalStorage;

if(typeof localStorage == 'undefined'){
    myLocalStorage= new localStorageClass();
    myLocalStorage.init();
} else {
    myLocalStorage=window.localStorage;
}

//设置cookie
function setPermanentCookie(name, value) {
    myLocalStorage.setItem(name,escape(value));
}
function setCookie(name, value, str) {
    myLocalStorage.setItem(name,escape(value));
    expCookie(name, str);
}

//获取cookie的值
function getCookie(name) {
    var now = new Date();
    var nowDate = now.getTime();
    var nowValue = myLocalStorage.getItem(name);
    var expDate = myLocalStorage.getItem(name+"expCookie");
    //2022.7.1 Tiger
    if (expDate!=null && expDate !='') {
        //next
    } else {
        return unescape(nowValue); //permanent
    }
    
    if (nowValue !=null && nowValue !='') {
        if (nowDate > expDate){
            return "";
        } else {
            return unescape(nowValue);
        }
    } else {
        return "";
    }
}

//设置cookie到期时间
function expCookie(name, str) {
    var exp = new Date();
    exp = exp.getTime()+ getMillisec(str);
    var val = myLocalStorage.getItem(name);
    if (val != null){
        myLocalStorage.setItem(name+"expCookie",exp);
    }
}

//删除cookie
function delCookie(name){
    var name = escape(name);
    myLocalStorage.removeItem(name);
}

//删除所有cookie
function delAllCookie(){
    myLocalStorage.clear();
}

//cookie到期时间处理
function getMillisec(str) {
    var sign = str.substring(0,1);
    var value = str.substring(1,str.length);
    if(sign == "s"){
        return value * 1000;
    } else if(sign == "m"){
        return value * 60 * 1000;
    }else if(sign == "h"){
        return value * 60 * 60 * 1000;
    }else if(sign == "d"){
        return value * 24 * 60 * 60 * 1000;
    }else{
        return value;
    }
}

