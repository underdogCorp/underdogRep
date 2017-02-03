<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
 function mypage(){
 	alert("로그인 해주세요");
         location.href="/member/loginForm";     
 }
</script>



       <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h5>Pinterest?</h5>
                                            <ul>
                                                <li><a href="/board/introduce">회사소개</a>
                                                </li>
                                                <li><a href="/board/contact">Contact</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h5>능력자들</h5>
                                            <ul>
                                                <li><a href="/product/item_introduce">능력자란?</a>
                                                </li>
                                                <li><a href="/product/list">능력자 보기</a>
                                                </li>
                                                <li><a href="/product/registerForm">능력등록</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h5>게시판</h5>
                                            <ul>
                                                <li><a href="/board/slist?bo_bbsid=01">공지사항</a>
                                                </li>
                                                <li><a href="/board/slist?bo_bbsid=02">자유게시판</a>
                                                </li>
                                                <li><a href="/board/slist?bo_bbsid=03">F A Q</a>
                                                </li>
                                                <li><a href="/board/slist?bo_bbsid=04">Q & A</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                        <c:if test="${sessionScope.MEMBER == null }">
                                            <h5>멤버십</h5>
                                        </c:if>
                                        <c:if test="${sessionScope.MEMBER != null }">
                                            <h5>${sessionScope.MEMBER.me_name}님</h5>
                                        </c:if>  
                                            <ul>
				                            <c:if test="${sessionScope.MEMBER == null}">
												<li><a href="/member/loginForm">로그인하기</a></li>
												<li><a href="/member/joinForm">회원 가입하기</a></li>
											</c:if>
											<c:if test="${sessionScope.MEMBER != null }">
												<li><a href="/basket/view?me_email=${sessionScope.MEMBER.me_email}">장바구니</a></li>
												<li>
												<c:if test="${sessionScope.MEMBER.me_email ne null}">
													<a href="/mypage/mypage">마이페이지</a>
												</c:if> 
												<c:if test="${sessionScope.MEMBER.me_email eq null}">
													<a onclick="mypage()" style="cursor:pointer;">마이페이지</a>					
												</c:if> 
												</li>
												<li><a href="/member/logoutProc">로그아웃</a></li>
											</c:if>
											<c:if test="${sessionScope.MEMBER.me_grade == 100}">
												<li><a href="/manager/manager">관리자모드</a></li>
											</c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </div>