<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] IT={"프로그래밍","하드웨어","컴퓨터조립"};
String[] day={"술친구","밥친구","놀이공원친구","결혼식하객친구"};
String[] life={"설거지","요리","화분가꾸기","형광등"};
String[] exe={"운동같이해주기","트레이닝해주기"};
String[] music={"악기레슨","악기사주기"};
String[] medic={"손따주기","반창고 붙혀주기"};
String[] law={"층간소음","반려견 관련"};

request.setAttribute("IT",IT);
request.setAttribute("day",day);
request.setAttribute("life",life);
request.setAttribute("exe",exe);
request.setAttribute("music",music);
request.setAttribute("medic",medic);
request.setAttribute("law",law);
%>