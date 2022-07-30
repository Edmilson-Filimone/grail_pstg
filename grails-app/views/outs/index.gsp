<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'outs.label', default: 'Outs')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row icon-button">
                <a href="#list-outs" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li class="myIcon"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li class="myIcon"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-outs" class="col-12 content scaffold-list" role="main">
                    <h2 class="myH2"><g:message code="default.list.label" args="[entityName]" /></h2>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <!--f:table collection="${outsList}"/-->
                    <table class="table table-striped table-dark">
                        <thead thead-light>
                            <tr>
                                <th>Material</th>
                                <th>Store</th>
                                <th>Quantity</th>
                                <th>Destiny</th>
                                <th>Date</th>
                            </tr>
                        <thead>
                        <tbody>
                            <g:each var="item" in="${outsList}">
                               <tr>
                                    <td> <g:link action="show" id="${item.id}">${item.material}</g:link></td>
                                    <td>${item.store}</td>
                                    <td>${item.quantity}</td>
                                    <td>${item.destiny}</td>
                                    <td>${item.date}</td>
                               </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <div>
                        <button type="button" class="btn btn-lg btn-outline-secondary" onclick="window.print()">print</button>
                    </div>
                    <g:if test="${outsCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${outsCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>