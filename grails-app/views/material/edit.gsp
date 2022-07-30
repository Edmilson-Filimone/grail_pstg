<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'material.label', default: 'Material')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#edit-material" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="edit-material" class="col-12 content scaffold-edit" role="main">
                    <h1 class="myH1"><g:message code="default.edit.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.material}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.material}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <g:form resource="${this.material}" method="PUT">
                        <g:hiddenField name="version" value="${this.material?.version}" />
                        <fieldset class="form">
                            <f:with bean="material" id="field">
                                <f:field property="store"/>
                                <f:field property="name"/>
                                <!--f:field property="expireDate"/-->
                                <label for="date">Expire Date</label>
                                <input type="date" name="expireDate" id="date">
                                <input type="text" name="quantity" value="0" hidden>
                            </f:with>
                        </fieldset>
                        <button type="submit" class="button btn-primary">Save</button>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
