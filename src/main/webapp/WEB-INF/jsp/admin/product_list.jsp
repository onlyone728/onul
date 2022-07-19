<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="productListView" class="w80">
	<div class="titleLabel">상품 리스트</div>
	<div class="d-flex justify-content-end">
		<button type="button" id="addProductBtn" class="btn mb-3">상품 올리기</button>
	</div>
	<table class="ListTable table">
		<thead>
			<tr>
				<th>ID</th>
				<th>카테고리</th>
				<th>상품명</th>
				<th>상품가격</th>
				<th>배송비</th>
				<th>원산지</th>
				<th>판매타입</th>
				<th>판매량</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${productList}" varStatus="status">
				<tr>
					<td class="col-1"><a href="/admin/edit_product_view/${item.id}">${item.id}</a></td>
					<td class="col-2"><a href="#">${item.productCategory}</a></td>
					<td class="col-3"><a href="/admin/edit_product_view/${item.id}">${item.productName}</a></td>
					<td class="col-2"><a href="#">${item.price}</a></td>
					<td class="col-1"><a href="#">${item.delivery}</a></td>
					<td class="col-1"><a href="#">${item.origin}</a></td>
					<td class="col-1"><a href="#">${item.salesType}</a></td>
					<td class="col-1"><a href="#">${item.countSales}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
$(document).ready(function() {
	$('#addProductBtn').on('click', function() {
		location.href = "/admin/create_product_view";	
	});
});
</script>