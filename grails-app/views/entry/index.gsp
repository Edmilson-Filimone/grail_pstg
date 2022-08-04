<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row icon-button">
                <a href="#list-entry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li class="myIcon"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li class="myIcon"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-entry" class="col-12 content scaffold-list" role="main">
                    <h2 class="myH2"><g:message code="default.list.label" args="[entityName]" /></h2>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <!--f:table collection="${entryList}" /-->
                    <table class="table table-striped table-dark">
                        <thead thead-light>
                            <tr>
                                <th>Material</th>
                                <th>Store</th>
                                <th>Quantity</th>
                                <th>Date</th>
                            </tr>
                        <thead>
                        <tbody>
                            <g:each var="entry" in="${entryList}">
                               <tr>
                                    <td> <g:link action="show" id="${entry.id}">${entry.material}</g:link></td>
                                    <td>${entry.store}</td>
                                    <td>${entry.quantity}</td>
                                    <td>${entry.date}</td>
                               </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <div>
                        <button type="button" class="btn btn-lg btn-outline-secondary"><g:link controller="stream" action="entry_csv"><i class="fa-solid fa-circle-down"></i></g:link></button>
                    </div>
                    <g:if test="${entryCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${entryCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>