<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@include file="../includes/header.jsp"%>



<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"style="background-color:#B0DAF8;"><center><b>Customer detail</b></center></div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
					<form:form method = "POST" action ="${pageContext.request.contextPath}/mvc/customer/save" modelAttribute="customer">
							<form:hidden path="id"/>
							<form:hidden path="zipfile"/>
							<div class="form-group">
								<form:label path = "customerName">Name</form:label>
								<form:input path = "customerName" cssClass="form-control" />
								
								<form:label path = "email">Email</form:label>
								<form:input path = "email" cssClass="form-control" />
								
								<form:label path = "phone">Phone</form:label>
								<form:input path = "phone" cssClass="form-control" />
							</div>
							<div class="form-group">
								<form:label path = "city.id">City</form:label>
								<form:select path="city.id" items="${cityList}" itemLabel="cityName" itemValue="id" cssClass="form-control"/>
							</div>
					 		<div class="form-group">
								<form:label path = "customerName">Scenario</form:label>
								<table>
									 <tr>
										<c:forEach items="${scenarioList}" var="scenario" varStatus="loop">
											<c:if test="${not loop.first and loop.index % 7 == 0}">
								                </tr><tr>
								            </c:if>
								            <td style="padding:2px;">
											<label class="checkbox-inline">
												<c:set var="contains" value="false" />
													<c:forEach var="customerScenario" items="${customerScenarioList}">
													  <c:if test="${customerScenario eq scenario.name}">
													    <c:set var="contains" value="true" />
													  </c:if>
													</c:forEach>
													  <c:if test="${contains eq 'true'}">
													  	<input type="checkbox" disabled="disabled" checked="checked"> ${scenario.name}&nbsp;
													  </c:if>
													  <c:if test="${contains eq 'false'}">
													  	<input type="checkbox" disabled="disabled" > ${scenario.name}&nbsp;&nbsp;
													  </c:if>
											</label>
								            </td>
										</c:forEach>
									</tr>
								</table>
				            </div> 
							 <div class="form-group">
								<form:label path = "customerName">Interested Product List</form:label>
								<table>
									 <tr>
										<c:forEach items="${productList}" var="product" varStatus="loop">
											<c:if test="${not loop.first and loop.index % 4 == 0}">
								                </tr><tr>
								            </c:if>
									            <td style="padding:2px;">
													${product}&nbsp;&nbsp;
									            </td>
										</c:forEach>
									</tr>
								</table>								
							</div>
							<div class="form-group">
								<c:if test="${not empty customer.zipfile}">
									<a target="_blank" href="<spring:url value="/mvc/customer/downloadSnapshot?zipfile=${customer.zipfile}" htmlEscape="true"/>">Download Snapshots</a>
								</c:if>
							</div>
							</div>
				</div>
			</div>
							<div class="panel-heading"><center><button type="submit" class="btn btn-primary"><b>Save</b></button></center></div>
						
						</form:form>
					
		</div>
	</div>
</div>





<%@include file="../includes/footer.jsp"%>


 