<%@ page import="registartion.UserRegistration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userRegistration.label', default: 'UserRegistration')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
        <r:require module="registration"/>
        <r:script type="text/javascript">
            $(document).ready(function()
            {
               addValidationRules();
            });

            /**
             * Adding jQuery validation rules for registration form
             */
            function addValidationRules(){
                $("#userRegistrationForm").validate(
                        jQuery.validator.setDefaults({
                            errorElement: "div",
                            rules: {
                                firstName: {
                                    required: true
                                },
                                lastName:{
                                    required: true
                                },
                                userName:{
                                    required: true
                                },
                                password:{
                                    required: true
                                }
                            },
                            messages: {
                                firstName: {
                                    required: "<g:message code='registration.firstName.required'/>"
                                },
                                lastName: {
                                    required: "<g:message code='registration.lastName.required'/>"
                                },
                                userName: {
                                    required: "<g:message code='registration.userName.required'/>"
                                },
                                password:{
                                    required: "<g:message code='registration.password.required'/>"
                                }
                            }
                        })
                );
            }
        </r:script>
	</head>
	<body>
		<a href="#edit-userRegistration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-userRegistration" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userRegistrationInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userRegistrationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" action="update" name="userRegistrationForm">
				<g:hiddenField name="id" value="${userRegistrationInstance?.id}" />
				<g:hiddenField name="version" value="${userRegistrationInstance?.version}" />
				<fieldset class="form">
					<g:render template="form" model="[userRegistration:userRegistrationInstance]"/>
				</fieldset>
				<fieldset class="buttons">
                    <input class="save" type="submit" value="${g.message(code: 'default.button.update.label')}" title="Add"  onClick="persistRegistration();return false;"/>
					%{--<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />--}%
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
