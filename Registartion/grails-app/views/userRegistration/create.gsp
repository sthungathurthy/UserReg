<%@ page import="registartion.UserRegistration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userRegistration.label')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        %{--<g:javascript src=""/>--}%
        %{--<r:script disposition="jquery"/>--}%


        <r:script type="text/javascript">
            $(document).ready(function()
            {
               addValidationRules();
            });

            function persistRegistration(){
                if($("#userRegistrationForm").validate().form()){
                      $("#userRegistrationForm").submit();
                }
            }

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
		<a href="#create-userRegistration" class="skip" tabindex="-1"><g:message code="default.link.skip.label"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-userRegistration" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<g:form name="userRegistrationForm" action="save">
				<fieldset class="form">
					<g:render template="form" model="[userRegistration:userRegistration]"/>
				</fieldset>
				<fieldset class="buttons">
                    <input class="button" type="submit" value="${g.message(code: 'default.button.create.label')}" title="Add"  onClick="persistRegistration();return false;"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
