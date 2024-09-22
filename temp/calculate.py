#!/usr/bin/env python3

import cgi
import cgitb

# 디버깅을 위해 CGI 오류를 보여줌
cgitb.enable()

# Content-Type 헤더 출력 (HTML 형식)
print("Content-Type: text/html\n")

# CGI를 사용해 폼 데이터를 처리
form = cgi.FieldStorage()

# 입력값 가져오기
num1 = form.getfirst("num1", "0")
num2 = form.getfirst("num2", "0")
operation = form.getfirst("operation", "add")

# 사칙연산 수행
try:
    num1 = float(num1)
    num2 = float(num2)
    if operation == "add":
        result = num1 + num2
    elif operation == "subtract":
        result = num1 - num2
    elif operation == "multiply":
        result = num1 * num2
    elif operation == "divide":
        result = num1 / num2 if num2 != 0 else "0으로 나눌 수 없습니다."
    else:
        result = "알 수 없는 연산입니다."
except ValueError:
    result = "잘못된 입력입니다."

# 결과 출력
print(f"""
<html>
<head><title>사칙연산 결과</title></head>
<body>
    <h1>계산 결과</h1>
    <p>결과: {result}</p>
    <a href="/">다시 계산하기</a>
</body>
</html>
""")
