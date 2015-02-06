<%@ page import="registartion.UserRegistration" %>



<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'dateOfBirth', 'error')} ">
	<label for="dateOfBirth">
		<g:message code="userRegistration.dateOfBirth.label" default="Date Of Birth" />
		
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${userRegistrationInstance?.dateOfBirth}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="userRegistration.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${userRegistrationInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="userRegistration.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${userRegistrationInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="userRegistration.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${userRegistrationInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="userRegistration.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${userRegistrationInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="userRegistration.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${userRegistrationInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'userName', 'error')} ">
	<label for="userName">
		<g:message code="userRegistration.userName.label" default="User Name" />
		
	</label>
	<g:textField name="userName" value="${userRegistrationInstance?.userName}"/>
</div>

