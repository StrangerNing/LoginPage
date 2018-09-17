<%--
  Created by IntelliJ IDEA.
  User: Tsening Chu
  Date: 2018/9/14
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script type="text/javascript">
        window.onresize = setViewSize;
        var marginLeft = 0;
        var marginTop = 0;
        function setViewSize() {
            var w = window.innerWidth
            || document.documentElement.clientWidth
            || document.body.clientWidth;
            var h = window.innerHeight
            || document.documentElement.clientHeight
            || document.body.clientHeight;
            marginLeft = (w-468)/2;
            marginTop = (h-262)/2;
            document.getElementById("loginFormMain").style.marginLeft=marginLeft;
            document.getElementById("loginFormMain").style.marginTop=marginTop;
        }

        function foucusOnUsername() {
            setViewSize();
            if (document.loginForm){
                var usernameInput = document.loginForm.username;
                if (usernameInput){
                    usernameInput.focus();
                }
            }
            return;
        }
        function checkLogin() {
            var msg = checkUsername();
            if (msg == 5){
                msg = checkPassword();
            }
            return msg;
        }

        function checkUsername() {
            var username = document.loginForm.username;
            if(username.value.length>5 && username.value.length<19){
                var patrn = /^[a-zA-Z0-9_]{6,18}$/;
                if(!patrn.exec(username.value)){
                    return 1;
                }
                else return 5;
            }else {
                return 2;
            }
        }

        function checkPassword() {
            var password = document.loginForm.password;
            if(password.value.length>7 && password.value.length<13){
                var patrn = /^.*(?=.{8,12})(?=.*[a-zA-Z])(?=.*[0-9]).*$/;
                if (!patrn.exec(password.value)){
                    return 3;
                }
                else return 5;
            }else {
                return 4;
            }

        }
        
        function checkAndAlert() {
            var msg = checkLogin();
            console.log(msg);
            switch (msg){
                case 1:{
                    alert("用户名须为6~18位，可以包含英文字母、数字或下划线");
                    return false;
                }
                case 2:{
                    alert("用户名长度只能在6~18位之间！");
                    return false;
                }
                case 3:{
                    alert("密码须为8~12位，必须包含字母和数字");
                    return false;
                }
                case 4:{
                    alert("密码长度只能在8~12位之间！");
                    return false;
                }
                case 5:return true;
            }
            
        }
    </script>
</head>
<body bgcolor="#f0ffff" onload="javascript:foucusOnUsername();">
    <form action="index.jsp" name="loginForm">
        <div id = "loginFormMain">
            <table style="width:468px;height:262px;background-color: lightgray;text-align: center;">
                <tr>
                    <th colspan="2" align="center">登录</th>
                </tr>
                <tr>
                    <div id="msg" style="color: red;">&nbsp</div>
                </tr>
                <tr>
                    <td>username: <input type="text" style="width: 200px;height:30px " name="username"></td>
                </tr>
                <tr>
                    <td>password: <input type="password" style="width: 200px;height: 30px" name="password"></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="remember" value="remember" >自动登录</td>
                </tr>
                <tr>
                    <td align="center"><input formmethod="post" type="submit" style="cursor: pointer;font-style: inherit;" name="submit" onclick="return checkAndAlert();" value="登录">
                        <input type="reset" style="cursor: pointer" name=reset value="重置">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
