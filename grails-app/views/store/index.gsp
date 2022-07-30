<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'store.label', default: 'Store')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row icon-button">
                <a href="#list-store" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li class="myIcon"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li class="myIcon"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-store" class="col-12 content scaffold-list" role="main">
                    <h2 class="myH2"><g:message code="default.list.label" args="[entityName]" /></h2>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <!--f:table collection="${storeList}" /-->
                    <table class="table table-striped table-dark">
                        <thead thead-light>
                            <tr>
                                <th>Store</th>
                                <th>Material Number</th>
                            </tr>
                        <thead>
                        <tbody>
                            <g:each var="item" in="${storeList}">
                               <tr>
                                    <td> <g:link action="show" id="${item.id}">${item.name}</g:link></td>
                                    <td>
                                        ${item.material.size()}
                                    </td>
                               </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <g:if test="${storeCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${storeCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>