
<%@ page import="registartion.UserRegistration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userRegistration.label', default: 'UserRegistration')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userRegistration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userRegistration" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <g:sortableColumn property="userName" title="${message(code: 'userRegistration.userName.label', default: 'User Name')}" />
                        <g:sortableColumn property="firstName" title="${message(code: 'userRegistration.firstName.label', default: 'First Name')}" />
                        <g:sortableColumn property="lastName" title="${message(code: 'userRegistration.lastName.label', default: 'Last Name')}" />
						<g:sortableColumn property="dateOfBirth" title="${message(code: 'userRegistration.dateOfBirth.label', default: 'Date Of Birth')}" />
						<g:sortableColumn property="email" title="${message(code: 'userRegistration.email.label', default: 'Email')}" />
						<g:sortableColumn property="address" title="${message(code: 'userRegistration.address.label', default: 'Address')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${userRegistrationInstanceList}" status="i" var="userRegistrationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userRegistrationInstance.id}">${userRegistrationInstance.userName}</g:link></td>
						<td>${userRegistrationInstance.firstName}</td>
						<td>${userRegistrationInstance.lastName}</td>
						<td>${userRegistrationInstance.dateOfBirth}</td>
						<td>${userRegistrationInstance.email}</td>
						<td>${userRegistrationInstance.address}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userRegistrationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
