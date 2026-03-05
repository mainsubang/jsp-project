<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script>
window.onload = function() {
    document.frm.onsubmit = function() {
        const id = document.frm.id.value.trim();
        const pw = document.frm.pw.value;
        const pwChk = document.frm.pwChk.value;

        // 아이디 길이 확인
        if (id.length < 5) {
            alert("아이디를 입력하세요");
            return false;
        }

        // 비밀번호 동일 여부 확인
        if (pw !== pwChk) {
            alert("비밀번호 일치여부를 확인하세요");
            return false;
        }

        // 동일 문자/숫자 3회 이상 반복 금지
        // (예: aaa, 111, zzz 등)
        const repeatPattern = /(.)\1\1/;
        if (repeatPattern.test(pw)) {
            alert("영문 숫자는 3자 이상 입력할 수 없습니다.");
            return false;
        }

        // 모든 검증 통과 시 전송 허용
        return true;
    }
}
</script>
</head>
<body>
    <form name="frm" method="post">
        <p>아이디 : <input name="id"></p>
        <p>비밀번호 : <input type="password" name="pw"></p>
        <p>비밀번호 확인 : <input type="password" name="pwChk"></p>
        <button>전송</button>
    </form>
</body>
</html>