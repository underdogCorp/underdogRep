<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시판 입력폼</title>
	<link rel="stylesheet" type="text/css" href="/springsboard/css/bbs.css" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/springsboard/js/board.js"></script>
</head>

<body>
 <div id="bbswrite_wrap">
  <h2 class="bbswrite_title">게시판 입력폼</h2>
  <form method="post" action="/springsboard/board_write_ok.nhn">
   <table id="bbswrite_t">
   
    <tr>
     <th>회원닉네임</th>
     <td>
     <input name="bo_me_nick" id="board_name" size="14" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>비밀번호</th>
     <td>
      <input type="password" name="board_pass" id="board_pass" size="14"
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>글제목</th>
     <td>
      <input name="bo_title" id="board_subject" size="40" 
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>글내용</th>
     <td>
      <textarea name="bo_content"  id="board_content" rows="8" cols="50"
      class="input_box"></textarea>
     </td>
    </tr> 
    
   </table>
   
   <div id="bbswrite_menu">
    <input type="submit" value="등록" class="input_button" />
    <input type="reset" value="취소" class="input_button"
    onclick="$('#board_name').focus();" />
   </div>
  </form>
 </div>
</body>
</html>