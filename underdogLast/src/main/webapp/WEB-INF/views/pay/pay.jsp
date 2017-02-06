<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

     <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-9" id="basket">

                    <div class="box">

                        <form method="post" action="checkout1.html">

                            <h1>주문하기</h1>
                            <p class="text-muted">주문 상품들</p>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
											<th colspan="2">상품정보</th>
											<th>고용 형태</th>
											<th>고용 기간</th>
											<th>상품 가격</th>
											<th>상품 담은 날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody>

<c:forEach items="${basket}" var="basket">

			<tr>


				<td><a href="#"> <img src="/resources/img/detailsquare1.jpg"
						alt="White Blouse Armani" style="width:50px; height:50px;">
				</a></td>



				<td>${basket.ba_pr_idx }</td>
				<c:choose>
					<c:when test="${basket.ba_termsort == 'h'}">
						<td>시급</td>
					</c:when>
					<c:when test="${basket.ba_termsort == 'd'}">
						<td>일당</td>
					</c:when>
					<c:when test="${basket.ba_termsort == 'm'}">
						<td>월급</td>
					</c:when>
					<c:when test="${basket.ba_termsort == 'y'}">
						<td>연봉</td>
					</c:when>
					<c:otherwise>
						<td>??</td>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${basket.ba_termsort == 'h'}">
						<td>${basket.ba_termnum }시간</td>
					</c:when>
					<c:when test="${basket.ba_termsort == 'd'}">
						<td>${basket.ba_termnum }일</td>
					</c:when>
					<c:when test="${basket.ba_termsort == 'm'}">
						<td>${basket.ba_termnum }개월</td>
					</c:when>
					<c:when test="${basket.ba_termsort == 'y'}">
						<td>${basket.ba_termnum }년</td>
					</c:when>
					<c:otherwise>
						<td>??</td>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${basket.ba_sum >= 10000}">
						<fmt:parseNumber var="sumBasketDivide"
							value="${basket.ba_sum / 10000}" integerOnly="true" />
						<c:if test="${basket.ba_sum % 10000 == 0}">
							<td><c:out value="${sumBasketDivide}" /> 억원</td>
						</c:if>
						<c:if test="${basket.ba_sum % 10000 != 0}">
							<td><c:out value="${sumBasketDivide}" /> 억 <c:out
									value="${basket.ba_sum - sumBasketDivide * 10000}" /> 만원
								</h4></td>
						</c:if>
					</c:when>
					<c:otherwise>
						<td><c:out value="${basket.ba_sum }" /> 만원</td>
					</c:otherwise>
				</c:choose>
				<td>${basket.ba_regdate }</td>
			</tr>
			<c:set var="sumAll" value="${sumAll + basket.ba_sum }" />

</c:forEach>
                                    </tbody>
								</table>

<h4>
	합계금액 :
	<c:choose>
		<c:when test="${sumAll >= 10000}">
			<fmt:parseNumber var="sumAllDivide" value="${sumAll / 10000}"
				integerOnly="true" />
			<c:out value="${sumAllDivide}" /> 억 <c:out
				value="${sumAll - sumAllDivide * 10000}" /> 만원
</h4>
</c:when>
<c:otherwise>
	<c:out value="${sumAll }" /> 만원</h4>
</c:otherwise>
</c:choose>



                            </div>
                            <!-- /.table-responsive -->

                            <div class="box-footer">
                                <div class="pull-left">
                                    <a href="/product/list" class="btn btn-default"><i class="fa fa-chevron-left"></i> Continue shopping</a>
                                </div>
                                <div class="pull-right">
                                   <a href="/pay/read?me_email=${sessionScope.MEMBER.me_email}" class="btn btn-default"><i class="fa fa-refresh"></i> Update basket</a>
                                    <button type="submit" class="btn btn-primary">Proceed to checkout <i class="fa fa-chevron-right"></i>
                                    </button>
                                </div>
                            </div>

                        </form>

                    </div>
                    <!-- /.box -->


                    <div class="row same-height-row">
                        <div class="col-md-3 col-sm-6">
                            <div class="box same-height">
                                <h3>You may also like these products</h3>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <div class="product same-height">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="detail.html">
                                                <img src="/resources/img/product2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="detail.html">
                                                <img src="/resources/img/product2_2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="detail.html" class="invisible">
                                    <img src="/resources/img/product2.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3>Fur coat</h3>
                                    <p class="price">$143</p>
                                </div>
                            </div>
                            <!-- /.product -->
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <div class="product same-height">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="detail.html">
                                                <img src="/resources/img/product1.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="detail.html">
                                                <img src="/resources/img/product1_2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="detail.html" class="invisible">
                                    <img src="/resources/img/product1.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3>Fur coat</h3>
                                    <p class="price">$143</p>
                                </div>
                            </div>
                            <!-- /.product -->
                        </div>


                        <div class="col-md-3 col-sm-6">
                            <div class="product same-height">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="detail.html">
                                                <img src="/resources/img/product3.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="detail.html">
                                                <img src="/resources/img/product3_2.jpg" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="detail.html" class="invisible">
                                    <img src="/resources/img/product3.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3>Fur coat</h3>
                                    <p class="price">$143</p>

                                </div>
                            </div>
                            <!-- /.product -->
                        </div>

                    </div>


                </div>
                <!-- /.col-md-9 -->

                <div class="col-md-3">
                    <div class="box" id="order-summary">
                        <div class="box-header">
                            <h3>주문 </h3>
                        </div>
                        <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>

                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>Order subtotal</td>
                                        <th>$446.00</th>
                                    </tr>
                                    <tr>
                                        <td>Shipping and handling</td>
                                        <th>$10.00</th>
                                    </tr>
                                    <tr>
                                        <td>Tax</td>
                                        <th>$0.00</th>
                                    </tr>
                                    <tr class="total">
                                        <td>Total</td>
                                        <th>$456.00</th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>


                    <div class="box">
                        <div class="box-header">
                            <h4>Coupon code</h4>
                        </div>
                        <p class="text-muted">If you have a coupon code, please enter it in the box below.</p>
                        <form>
                            <div class="input-group">

                                <input type="text" class="form-control">

                                <span class="input-group-btn">

					<button class="btn btn-primary" type="button"><i class="fa fa-gift"></i></button>

				    </span>
                            </div>
                            <!-- /input-group -->
                        </form>
                    </div>

                </div>
                <!-- /.col-md-3 -->

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->
			
			
			
			
			
			
			



<%@ include file="/WEB-INF/views/include/footer.jsp"%>