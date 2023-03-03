<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core_1_1" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js">
</script>
    
<style>
	.img {
		width : 350px;
		height : 350px;
		border : 1px solid black;
	}
</style>
<h3>Main Page.</h3>
<form action="searchProduct.do">
	<input type="text" name="search">
	<input type="submit" value="검색하기">
</form>
<section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>가구</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:set var="isZzim" value="false" />
                        <c:forEach var="list" items="${list }">
                        	<c:if test="${list.proCategory eq '가구' }">
                        	            <c:forEach var="zzimList" items="${zzimList}">
								            <c:if test="${zzimList.proId eq list.proId}">
								                <c:set var="isZzim" value="true" />
								            </c:if>
								        </c:forEach>
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <c:choose>
								              <c:when test="${isZzim}">
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-heart text-danger"></i></a></li>
								              </c:when>
								              <c:otherwise>
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-heart"></i></a></li>
								              </c:otherwise>
								            </c:choose>
                                        <li><a>
                                            <i data-id="${list.proId}" data-price="${list.proPrice }" class="fa fa-shopping-cart"></i>
                                            </a></li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proId }"><img src="images/${list.proImg }" alt="" class="img"></a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <c:forEach items="${rateList }" var="rate">
                                    	<c:if test="${rate.proId eq list.proId }">
                                    		<c:if test="${rate.avgRate eq 5 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 4 && rate.avgRate < 5}">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 3 && rate.avgRate < 4 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 2 && rate.avgRate < 3 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 1 && rate.avgRate < 2 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${empty rate.avgRate}">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
	                                    </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>식품</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:set var="isZzim" value="false" />
                        <c:forEach var="list" items="${list }" varStatus="status">
                        	<c:if test="${list.proCategory eq '식품' }">
                        				<c:forEach var="zzimList" items="${zzimList}">
								            <c:if test="${zzimList.proId eq list.proId}">
								                <c:set var="isZzim" value="true" />
								            </c:if>
								        </c:forEach>
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <c:choose>
								              <c:when test="${isZzim}">
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-heart text-danger"></i></a></li>
								              </c:when>
								              <c:otherwise>
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-heart"></i></a></li>
								              </c:otherwise>
								            </c:choose>
                                            <li><a>
                                            		<i data-id="${list.proId}" data-price="${list.proPrice }" class="fa fa-shopping-cart cart"></i>
                                            	</a></li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proId }"><img src="images/${list.proImg }" alt="" class="img"></a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <c:forEach items="${rateList }" var="rate">
                                    	<c:if test="${rate.proId eq list.proId }">
                                    		<c:if test="${rate.avgRate eq 5 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 4 && rate.avgRate < 5}">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 3 && rate.avgRate < 4 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 2 && rate.avgRate < 3 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 1 && rate.avgRate < 2 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${empty rate.avgRate}">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
	                                    </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>위생용품</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:set var="isZzim" value="false" />
                        <c:forEach var="list" items="${list }" varStatus="status">
                        	<c:if test="${list.proCategory eq '위생용품' }">
                        				<c:forEach var="zzimList" items="${zzimList}">
								            <c:if test="${zzimList.proId eq list.proId}">
								                <c:set var="isZzim" value="true" />
								            </c:if>
								        </c:forEach>
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <c:choose>
								              <c:when test="${isZzim}">
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-heart text-danger"></i></a></li>
								              </c:when>
								              <c:otherwise>
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-heart"></i></a></li>
								              </c:otherwise>
								            </c:choose>
                                            <li><a>
                                            		<i data-id="${list.proId}" data-price="${list.proPrice }" class="fa fa-shopping-cart cart"></i>
                                            	</a></li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proId }"><img src="images/${list.proImg }" alt="" class="img"></a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <c:forEach items="${rateList }" var="rate">
                                    	<c:if test="${rate.proId eq list.proId }">
                                    		<c:choose>
	                                    		<c:when test="${rate.avgRate eq 5 }">
	                                    			<ul class="stars">
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                    </ul>
	                                    		</c:when>
	                                    		<c:when test="${rate.avgRate >= 4 && rate.avgRate < 5}">
	                                    			<ul class="stars">
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                    </ul>
	                                    		</c:when>
	                                    		<c:when test="${rate.avgRate >= 3 && rate.avgRate < 4 }">
	                                    			<ul class="stars">
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                    </ul>
	                                    		</c:when>
	                                    		<c:when test="${rate.avgRate >= 2 && rate.avgRate < 3 }">
	                                    			<ul class="stars">
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                    </ul>
	                                    		</c:when>
	                                    		<c:when test="${rate.avgRate >= 1 && rate.avgRate < 2 }">
	                                    			<ul class="stars">
				                                        <li><i class="fa fa-star text-danger"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                    </ul>
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<ul class="stars">
				                                        <li><i class="fa fa-star"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                        <li><i class="fa fa-star"></i></li>
				                                    </ul>
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>목욕용품</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:set var="isZzim" value="false" />
                        <c:forEach var="list" items="${list }" varStatus="status">
                        	<c:if test="${list.proCategory eq '목욕용품' }">
                        				<c:forEach var="zzimList" items="${zzimList}">
								            <c:if test="${zzimList.proId eq list.proId}">
								                <c:set var="isZzim" value="true" />
								            </c:if>
								        </c:forEach>
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <c:choose>
								              <c:when test="${isZzim}">
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-heart text-danger"></i></a></li>
								              </c:when>
								              <c:otherwise>
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-heart"></i></a></li>
								              </c:otherwise>
								            </c:choose>
                                            <li><a>
                                            		<i data-id="${list.proId}" data-price="${list.proPrice }" class="fa fa-shopping-cart cart"></i>
                                            	</a></li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proId }"><img src="images/${list.proImg }" alt="" class="img"></a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <c:forEach items="${rateList }" var="rate">
                                    	<c:if test="${rate.proId eq list.proId }">
                                    		<c:if test="${rate.avgRate eq 5 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 4 && rate.avgRate < 5}">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 3 && rate.avgRate < 4 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 2 && rate.avgRate < 3 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 1 && rate.avgRate < 2 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${empty rate.avgRate}">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
	                                    </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>장난감</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:set var="isZzim" value="false" />
                        <c:forEach var="list" items="${list }" varStatus="status">
                        	<c:if test="${list.proCategory eq '장난감' }">
                        				<c:forEach var="zzimList" items="${zzimList}">
								            <c:if test="${zzimList.proId eq list.proId}">
								                <c:set var="isZzim" value="true" />
								            </c:if>
								        </c:forEach>
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <c:choose>
								              <c:when test="${isZzim}">
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-heart text-danger"></i></a></li>
								              </c:when>
								              <c:otherwise>
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-heart"></i></a></li>
								              </c:otherwise>
								            </c:choose>
                                            <li><a>
                                            		<i data-id="${list.proId}" data-price="${list.proPrice }" class="fa fa-shopping-cart cart"></i>
                                            	</a></li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proId }"><img src="images/${list.proImg }" alt="" class="img"></a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <c:forEach items="${rateList }" var="rate">
                                    	<c:if test="${rate.proId eq list.proId }">
                                    		<c:if test="${rate.avgRate eq 5 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 4 && rate.avgRate < 5}">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 3 && rate.avgRate < 4 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 2 && rate.avgRate < 3 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 1 && rate.avgRate < 2 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${empty rate.avgRate}">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
	                                    </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>기타</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:set var="isZzim" value="false" />
                        <c:forEach var="list" items="${list }" varStatus="status">
                        	<c:if test="${list.proCategory eq '기타' }">
                        				<c:forEach var="zzimList" items="${zzimList}">
								            <c:if test="${zzimList.proId eq list.proId}">
								                <c:set var="isZzim" value="true" />
								            </c:if>
								        </c:forEach>
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <c:choose>
								              <c:when test="${isZzim}">
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-heart text-danger"></i></a></li>
								              </c:when>
								              <c:otherwise>
								                <li><a><i data-id="${list.proId}" class="zzim fa fa-"></i></a></li>
								              </c:otherwise>
								            </c:choose>
                                            <li><a>
                                            		<i data-id="${list.proId}" data-price="${list.proPrice }" class="fa fa-shopping-cart cart"></i>
                                            	</a></li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proId }"><img src="images/${list.proImg }" alt="" class="img"></a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <c:forEach items="${rateList }" var="rate">
                                    	<c:if test="${rate.proId eq list.proId }">
                                    		<c:if test="${rate.avgRate eq 5 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 4 && rate.avgRate < 5}">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 3 && rate.avgRate < 4 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 2 && rate.avgRate < 3 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${rate.avgRate >= 1 && rate.avgRate < 2 }">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star text-danger"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
                                    		<c:if test="${empty rate.avgRate}">
			                                    <ul class="stars">
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                        <li><i class="fa fa-star"></i></li>
			                                    </ul>
		                                    </c:if>
	                                    </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script>
    
    // 장바구니 담기 기능
    $('.fa.fa-shopping-cart').on('click', function() {
    	if(!'${logId}') {
    		alert("회원 전용 기능입니다.")
    		return;
    	}
    	
    	var proId = $(this).attr('data-id');
    	var caSumprice = $(this).attr('data-price');
    	
    	$.ajax({
    		url: 'productCartAdd.do',
    		method: 'post',
    		data: {memId :'${logId}', proId : proId, caQuant:1, caSumprice: caSumprice},
    		success: function(result) {
    			if (result.retCode == "Success") {
    				alert('장바구니 등록에 성공했습니다.');
    			} else if (result.retCode == "NoMember") {
    				var result = confirm('로그인이 필요한 기능입니다.\n확인을 누르면 로그인 페이지로 이동합니다.');

    		        if(result) {
    		            location.replace('loginForm.do');
    		        } else {
    		        }
    			} else {
    				alert('장바구니 등록에 실패했습니다.');
    				
    			}
    		},
    		error: function(err) {
    			console.log(err);
    		}
    	});
    });
    // 찜 추가 기능
        $('.zzim').on('click', function() {
        	
        	var $this = $(this);
        	if(!'${logId}') {
        		alert("회원 전용 기능입니다.")
        		return;
        	}
        	var proId = $(this).attr('data-id');
        	if(!$this.hasClass('text-danger')){
        		$.ajax({
    	    		url: 'addZzim.do',
    	    		method: 'post',
    	    		data: {memId :'${logId}', proId : proId},
    	    		success: function(result) {
    	    			if (result.retCode == "Success") {
    	    				alert('찜목록에 등록에 성공했습니다.');
    	    				$this.addClass('text-danger');
    	    				
    	    			} else if (result.retCode == "NoMember") {
    	    				var result = confirm('로그인이 필요한 기능입니다.\n확인을 누르면 로그인 페이지로 이동합니다.');
    	
    	    		        if(result) {
    	    		            location.replace('loginForm.do');
    	    		        } else {
    	    		        }
    	    			} else {
    	    				alert('찜목록 등록에 실패했습니다.');
    	    				
    	    			}
    	    		},
    	    		error: function(err) {
    	    			console.log(err);
    	    		}
    	    	});
        	} else {
        		$.ajax({
    	    		url: 'productZzimDel.do',
    	    		method: 'post',
    	    		data: {memId :'${logId}', proId : proId},
    	    		success: function(result) {
    	    			if (result.retCode == "Success") {
    	    				alert('찜목록에서 삭제를 성공했습니다.');
    	    				$this.removeClass('text-danger');
    	    				
    	    			} else if (result.retCode == "NoMember") {
    	    				var result = confirm('로그인이 필요한 기능입니다.\n확인을 누르면 로그인 페이지로 이동합니다.');
    	
    	    		        if(result) {
    	    		            location.replace('loginForm.do');
    	    		        } else {
    	    		        }
    	    			} else {
    	    				alert('찜목록 등록에 실패했습니다.');
    	    				
    	    			}
    	    		},
    	    		error: function(err) {
    	    			console.log(err);
    	    		}
    	    	});
        		
        	}
	    	
	    });
     

    </script>