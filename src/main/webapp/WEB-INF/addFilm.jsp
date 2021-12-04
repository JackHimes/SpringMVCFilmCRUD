<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <jsp:useBean id="map" class="java.util.HashMap" scope="request"/> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Film Details</title>
	</head>
	<body>
		<%@ include file="nav.jsp" %>
		
		<c:if test="${not empty error }">
			<h3>${error }</h3>
		</c:if>
		
		<form action="addFilm.do" id="filmDetails" method="POST">		 	
			<table>
				<tr>
					<td>
						<label for="title">Title</label> 
					</td>
					<td>
						<input type="text" name="title" value="Title" size="50"/> 
					</td>
				</tr>
			
				<tr>
					<td>
						<label for="description">Description</label>
					</td>
					<td>
					 	<textarea name="description" rows="5" cols="35"></textarea>
					</td>
				</tr>
			
				<tr>
					<td>
						<label for="releaseYear">Release Year</label>
					</td>
					<td>
						<input type="number" name="releaseYear" min="0" max="9999" step="1" value="0"/>							 	
					</td>
				</tr>

				<tr>
					<td>
						<label for="languageId">Language ID:</label>
					</td>
					<td>
						<c:set target="${requestScope.map}" property="1" value="English"/>  
						<c:set target="${requestScope.map}" property="2" value="Italian"/>  
						<c:set target="${requestScope.map}" property="3" value="Japanese"/>  
						<c:set target="${requestScope.map}" property="4" value="Mandarin"/>  
						<c:set target="${requestScope.map}" property="5" value="French"/>  
						<c:set target="${requestScope.map}" property="6" value="German"/>  
						
						<c:forEach items="${requestScope.map}" var="language">  
						    <c:choose>
							
								<c:when test="${language.key == 1}">
									<input id="${language.value }" name="languageId" type="radio" value="${language.key }" checked="checked"/>				
								</c:when>
								<c:otherwise>
									<input id="${language.value }" name="languageId" type="radio" value="${language.key }"/>				
								</c:otherwise>
								
							</c:choose>
								<label for="${language.key }">${language.key } (${language.value})</label>
						</c:forEach>					 	
					</td>
				</tr>
			
				<tr>
					<td>
						<label for="rentalDuration">Rental Duration:</label>
					</td>
					<td>
						<input type="number" name="rentalDuration" min="0" max="255" step="1" value="3"/>
						(Days)
					</td>
				</tr>
			
				<tr>
					<td>
						<label for="rentalRate">Rental Rate:</label>
					</td>
					<td>
						<input type="number" name="rentalRate" min="0" max="99.99" step="0.01" value="4.99"/>
						$
					</td>
				</tr>
			
				<tr>
					<td>
						<label for="length">Film Length:</label>
					</td>
					<td>
						<input type="number" name="length" min="0" max="32767" step="1" value="0"/>
						(Minutes)
					</td>
				</tr>
			
				<tr>
					<td>
						<label for="replacementCost">Replacement Cost:</label>
					</td>
					<td>
						<input type="number" name="replacementCost" min="0" max="999.99" step="0.01" value="19.99"/>
						$							 	
					</td>
				</tr>
			
				<tr>
					<td>
						<label for="rating">Rating:</label>
					</td>
					<td>
						<c:forTokens items="G,PG,PG13,R,NC17" delims="," var="value">
						
							<c:choose>
							
								<c:when test="${value == 'G'}">
									<input id="${value }" name="rating" type="radio" value="${value }" checked="checked"/>				
								</c:when>
								<c:otherwise>
									<input id="${value }" name="rating" type="radio" value="${value }"/>				
								</c:otherwise>
								
							</c:choose>
 									<label for="${value }">${value }</label>
						
						</c:forTokens>
						
					</td>
				</tr>
			</table>			
			
			<input type="submit" value="Save"/>
		</form>

		
	</body>
</html>