<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#create-entry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="create-entry" class="col-12 content scaffold-create" role="main">
                    <h1 class="myH1">Regist new Entry</h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.entry}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.entry}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <g:form resource="${this.entry}" method="POST">
                        <fieldset class="form">
                            <f:with bean="entry" id="field">
                                <f:field property="material"/>
                                <f:field property="store"/>
                                <f:field property="quantity"/>
                                <label for="date">Date</label>
                                <input type="date" name="Date" id="date">
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
