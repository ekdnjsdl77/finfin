<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<%@ include file="/include/seller/header.jsp" %>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/seller.js"></script>
	<script src="/js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		//HTML Editor
		tinymce.init({selector:'textarea'});
		
		var ctg_no_2 = "";
		var ctg_no_3 = "";
		
		function setCategory3(){
			
			var objStruct = new Array();
			
			// 수초 스케이핑/테라리움(01)
			if (ctg_no_2 == "01") {
				objStruct.push({value:"01", text:"수초"});
				objStruct.push({value:"02", text:"수초 청소 관리용품"});
				objStruct.push({value:"03", text:"장식/은신처"});
				objStruct.push({value:"04", text:"아쿠아스케이프 갤러리"});
				objStruct.push({value:"05", text:"수석"});
				objStruct.push({value:"06", text:"레이아웃 유목"});
				objStruct.push({value:"07", text:"바닥재(모래/자갈/산호사)"});
				}
			// 먹이(02)
			else if(ctg_no_2 == "02") {
				objStruct.push({value:"01", text:"소형어/치어"});
				objStruct.push({value:"02", text:"베타/금붕어/거북이"});
				objStruct.push({value:"03", text:"중/대형어"});
				objStruct.push({value:"04", text:"시클리드/디스커스"});
				objStruct.push({value:"05", text:"코리/플레코"});
				objStruct.push({value:"06", text:"새우/가재/갑각류"});
				objStruct.push({value:"07", text:"생먹이/냉동먹이"});
				objStruct.push({value:"08", text:"브랜드별"});
			}
			// 수조/수조받침(03)
			else if(ctg_no_2 == "03") {
				objStruct.push({value:"01", text:"받침대/축양장"});
				objStruct.push({value:"02", text:"누드/디아망수조"});
				objStruct.push({value:"03", text:"플라스틱어항"});
			}
			// 수질관리(04)
			else if(ctg_no_2 == "04") {
				objStruct.push({value:"01", text:"박테리아제"});
				objStruct.push({value:"02", text:"수질테스트"});
				objStruct.push({value:"03", text:"치료/예방"});
				objStruct.push({value:"04", text:"영양제/첨가제"});
				objStruct.push({value:"05", text:"물갈이제"});
			}	
			// 조명(05)
			else if(ctg_no_2 == "05") {
				objStruct.push({value:"01", text:"조명"});
				objStruct.push({value:"02", text:"등커버"});
				objStruct.push({value:"03", text:"스티커등/수중등"});
				objStruct.push({value:"04", text:"UV관련"});
				objStruct.push({value:"05", text:"미니등"});
				objStruct.push({value:"06", text:"등 커버"});
				objStruct.push({value:"07", text:"미니 등"});
				objStruct.push({value:"08", text:"스피커·수중 등"});
				objStruct.push({value:"09", text:"UV 관련"});
				objStruct.push({value:"10", text:"할로겐조명"});
			}
			// 히터/에어/여과용품(06)
			else if(ctg_no_2 == "06") {
				objStruct.push({value:"01", text:"여과기/여과재"});
				objStruct.push({value:"02", text:"에어용품/수중모터"});
				objStruct.push({value:"03", text:"히터"});
				objStruct.push({value:"04", text:"기포기/기포기소품"});
			}
			// 청소/관리(07)
			else if(ctg_no_2 == "07") {
				objStruct.push({value:"01", text:"생물봉투"});
				objStruct.push({value:"02", text:"온도계"});
				objStruct.push({value:"03", text:"산란/부화용품"});
				objStruct.push({value:"04", text:"볼탑/하우징"});
				objStruct.push({value:"05", text:"청소용품/수조소품"});
			}
			// 중분류 코드가 없으면 소분류 초기화(있으면 중분류에 해당하는 소분류 설정)
			if (ctg_no_2 == "")	createOption("ctg_no_3", null, "선택", "");
			else						createOption("ctg_no_3", objStruct, "선택", ctg_no_3);
		}
		
		window.onload = function() {
			
			var objStruct = new Array();
			
			objStruct.push({value:"01", text:"수초 스케이핑/테라리움"});
			objStruct.push({value:"02", text:"먹이"});
			objStruct.push({value:"03", text:"수조/수조받침"});
			objStruct.push({value:"04", text:"수질관리"});
			objStruct.push({value:"05", text:"조명"});
			objStruct.push({value:"06", text:"히터/에어/여과용품"});
			objStruct.push({value:"07", text:"청소/관리"});
			
			createSelect("span_ctg_no_2", "ctg_no_2", objStruct, "선택", ctg_no_2, 100);
			document.getElementById("ctg_no_2").onchange = function() {
				ctg_no_2 = this.value;
				ctg_no_3 = "";
				setCategory3();
			}			
			
			createSelect("span_ctg_no_3", "ctg_no_3", null, "선택", "", 100);
			setCategory3();
		}	
		
		function modifyProc() {
		    // ctg_no_2와 ctg_no_3 엘리먼트를 가져올 때 null 체크를 해주어야 합니다.
		    var ctg_no_2_element = document.getElementById("ctg_no_2");
		    var ctg_no_3_element = document.getElementById("ctg_no_3");

		    if (ctg_no_2_element && getOptionValue(ctg_no_2_element) == "") {
		        ctg_no_2_element.focus();
		        alert(MSG_INT_CTG);
		        return;
		    }

		    if (ctg_no_3_element && getOptionValue(ctg_no_3_element) == "") {
		        ctg_no_3_element.focus();
		        alert(MSG_INT_CTG);
		        return;
		    }
			
			/*
			if (getOptionValue(document.getElementById("cd_ctg_where_2")) == ""
					|| getOptionValue(document.getElementById("cd_ctg_where_3")) == ""
					|| getOptionValue(document.getElementById("cd_ctg_where_4")) == "") {
				alert(MSG_INT_CTG);
				return;
			}
			*/
			
			// (1)로 고정
			document.getElementById("ctg_no").value = "1"
												+ getOptionValue(document.getElementById("ctg_no_2"))
												+ getOptionValue(document.getElementById("ctg_no_3"));
			
			// 제출 전에 ","를 모두 제거
			document.getElementById("price_sale").value = document.getElementById("price_sale").value.replaceAll(",", "");
			
			var frmMain = document.getElementById("frmMain");
			frmMain.action = "/seller/sale/modifyProc.web";
			frmMain.submit();
		}
	</script>
</head>
<body>
<div id="page">
<div class="container">
<form id="frmMain" method="POST">
	<input type="hidden" name="seq_sle" value="${saleDto.seq_sle}" />
	<input type="hidden" name="seq_prd" value="${saleDto.seq_prd}" />
	<input type="hidden" name="ctg_no" id="ctg_no" />
	<header>
		<%@ include file="/include/seller/top.jsp" %>
	</header>
	<section class="content">
		<nav>
			<%@ include file="/include/seller/sale/lnb.jsp" %>
		</nav>
		<article>
			<table class="type_02" style="margin-left: auto; margin-right: auto;">
				<tr>
					<th style="width:200px;">판매명</th>
					<td>
						<input type="text" name="sle_nm" style="width: 300px" value="${saleDto.sle_nm}" />
					</td>
				</tr>
				<tr>
					<th>설명</th>
					<td>
						<textarea name="desces" id="contents" style="width: 650px;height:200px;" maxlength="1000">${saleDto.desces}</textarea>
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<span id="span_ctg_no_1"></span>
						<span id="span_ctg_no_2"></span>
						<span id="span_ctg_no_3"></span>
					</td>
				</tr>
				<tr>
					<th>판매 가격</th>
					<td>
						<input type="text" id="price_sale" name="price_sale" style="width:100px; text-align:right" onkeyup="commaValue(this);" value="${saleDto.price_sale}"/>
					</td>
				</tr>
				<tr>
					<th>판매 상태</th>
					<td>
						<select name="cd_state_sale">
							<option value="0"<c:if test="${saleDto.cd_state_sale == 0}"> selected</c:if>>판매 대기</option>
							<option value="1"<c:if test="${saleDto.cd_state_sale == 1}"> selected</c:if>>판매중</option>
							<option value="2"<c:if test="${saleDto.cd_state_sale == 2}"> selected</c:if>>판매 중지</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td>
						<img src="${saleDto.img}" alt="판매상품 이미지" />
					</td>
				</tr>
			</table>
			<input type="button" value="수정" onclick="javascript:modifyProc();"/>
		</article>
		<aside></aside>
	</section>
	</form>
</div>
</div>
	<footer>
		<%@ include file="/include/footer.jsp" %>
	</footer>
</body>
</html>