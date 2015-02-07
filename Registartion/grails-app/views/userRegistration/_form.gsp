<%@ page import="registartion.UserRegistration" %>




<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'firstName', 'error')} ">
    <label for="firstName">
        <g:message code="userRegistration.firstName.label"/>
        <span class="required"></span>
    </label>
    <g:field type="text"  class="required" name="firstName" value="${userRegistration?.firstName}"/>
    <div for="firstName" generated="true" class="error"></div>
</div>

<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'lastName', 'error')} ">
    <label for="lastName">
        <g:message code="userRegistration.lastName.label"/>
        <span class="required"></span>
    </label>
    <input type="text" id="lastName" class="required" name="lastName" value="${userRegistration?.lastName}"/>
    <div for="lastName" generated="true" class="error"></div>
</div>

<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'userName', 'error')} ">
    <label for="userName">
        <g:message code="userRegistration.userName.label"/>
        <span class="required"></span>
    </label>
    <input type="text"  id="userName" class="required" name="userName" value="${userRegistration?.userName}"/>
    <div for="userName" generated="true" class="error"></div>
</div>

<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'password', 'error')} ">
    <label for="password">
        <g:message code="userRegistration.password.label" />
        <span class="required"></span>
    </label>
    <input type="password"  id="password" class="required" name="password" value="${userRegistration?.password}"/>
    <div for="password" generated="true" class="error"></div>
</div>
<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'dateOfBirth', 'error')} ">
	<label for="dateOfBirth">
		<g:message code="userRegistration.dateOfBirth.label"/>
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${userRegistration?.dateOfBirth}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="userRegistration.email.label" default="Email" />
		
	</label>
	<input type="email" id="email" name="email" value="${userRegistration?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userRegistrationInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="userRegistration.address.label"/>
		
	</label>
	<g:textArea name="address" value="${userRegistration?.address}"/>
</div>



