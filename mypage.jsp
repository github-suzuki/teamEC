<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/form.css">
<link rel="stylesheet" href="./css/table.css">
<title>マイページ画面</title>
</head>
<body>

	<jsp:include page="header.jsp" />
	<div id="contents">
		<h1>マイページ画面</h1>

		<!-- もし「userInfoDTO」が空じゃなかったら以下を表示 -->
		<s:if test="userInfoDTO!=null">

			<!-- 購入ボタンを押下したら商品購入履歴を表示 -->
			<s:form action="PurchaseHistoryAction">
				<table class="vertical-list">
					<tr>
						<th scope="row"><s:label value="姓" /></th>
						<td><div class="property">
								<s:property value="userInfoDTO.familyName" />
							</div></td>
					</tr>

					<tr>
						<th scope="row"><s:label value="名" /></th>
						<td><div class="property">
								<s:property value="userInfoDTO.firstName" />
							</div></td>
					</tr>

					<tr>
						<th scope="row"><s:label value="ふりがな" /></th>
						<td><div class="property">
								<s:property value="userInfoDTO.familyNameKana" />
								<span> </span>
								<s:property value="userInfoDTO.firstNameKana" />
							</div></td>
					</tr>

					<tr>
						<th scope="row"><s:label value="性別" /></th>
						<td><div class="property">
								<s:if test="userInfoDTO.sex==1">女性</s:if>
								<s:else>男性</s:else>
							</div></td>
					</tr>

					<tr>
						<th scope="row"><s:label value="メールアドレス" /></th>
						<td><div class="property">
								<s:property value="userInfoDTO.email" />
							</div></td>
					</tr>
				</table>
				<div class="submit_button">
					<s:submit class="button" value="購入履歴" />
				</div>
			</s:form>
		</s:if>

		<s:else>
			<div class="info">ユーザー情報がありません。</div>
		</s:else>
	</div>
</body>
</html>