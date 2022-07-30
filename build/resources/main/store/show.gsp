<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'store.label', default: 'Store')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#show-store" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="show-store" class="col-12 content scaffold-show" role="main">
                    <h1 class="myH1"><g:message code="default.show.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <div class="show-me">
                        <ul>
                            <li>
                                <span class="rotulo">Name</span>
                                <span class="valor">${store.name}</span>
                            </li>
                        </ul>
                    </div>
                    <div class="edit-delete">
                        <button class="editar btn-warning">
                            <g:link class="edit" action="edit" resource="${this.store}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        </button>
                        <g:form resource="${this.store}" method="DELETE">
                            <input class="deletar btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </g:form>
                    </div>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
