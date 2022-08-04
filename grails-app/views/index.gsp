<!doctype html>
<html lang="pt">
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <%@ page import="labstore.Material"%>
    <%@ page import="labstore.Entry"%>
    <%@ page import="labstore.Outs"%>
</head>
<body>
<content tag="nav">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Labs<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="${createLink(controller:"store", action:"create")}">Regist</a></li>
            <li class="dropdown-item"><a href="${createLink(controller:"store")}">Store</a></li>
            <li role="separator" class="dropdown-divider"></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Material<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="${createLink(controller:"material", action:"create")}">Regist Material</a></li>
            
            <li class="dropdown-item"><a href="${createLink(controller:"material")}">All Material</a></li>
        </ul>
    </li>
        <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Entry<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="${createLink(controller:"entry", action:"create")}">Regist Entry</a></li>
            
            <li class="dropdown-item"><a href="${createLink(controller:"entry")}">All Entries</a></li>
        </ul>
    </li>
        </li>
        <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Outs<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="${createLink(controller:"outs", action:"create")}">Regist Outs</a></li>
            
            <li class="dropdown-item"><a href="${createLink(controller:"outs")}">All Outs</a></li>
        </ul>
    </li>
</content>
    <div id="content" role="main">
        <section>
            <div class="body">
                <aside class="sidebar">
                    <div class="contaiener">
                        <div class="head-sidebar">
                            <div class="side-img">
                                <!--i class="fa-solid fa-house"></i-->
                                <i class="fa-solid fa-house-user"></i>
                            </div>
                            <h4 class="title">Labstore Manager</h4>
                            <p class="sub-title">philimone99@gmail.com</p>
                        </div>
                        <div class="body-sidbar">
                            <ul class="list">
                                <li>
                                    <span class="side-icon"><i class="fa-solid fa-list-check"></i></span>
                                    <span class="side-label"><a href="${createLink(controller:"material")}">Materials</a></span>
                                </li>
                                <li>
                                    <span class="side-icon"><i class="fa-solid fa-share"></i></span>
                                    <span class="side-label"><a href="${createLink(controller:"entry")}">Entries</a></span>
                                </li>
                                <li>
                                    <span class="side-icon"><i class="fa-solid fa-reply"></i></span>
                                    <span class="side-label"><a href="${createLink(controller:"outs")}">Outs</a></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </aside>
                <div class="main">
                    <div class="cards">
                        <div class="box" id="zero">
                            <li class="flex">
                                <span class="label">Material</span>
                                <span class="icon"><i class="fa-solid fa-boxes-stacked"></i></span>
                            </li>
                            <g:set var="material" value="${Material?.list()}"/>
                            <li class="value">${material?.size()}</li>
                        </div>
                        <div class="box" id="one">
                            <li class="flex">
                                <span class="label">Entries</span>
                                <span class="icon"><i class="fa-solid fa-arrow-right-to-bracket"></i></span>
                            </li>
                            <g:set var="entry" value="${Entry?.list()}"/>
                            <li class="value">${entry?.size()}</li>
                        </div>
                        <div class="box" id="two">
                            <li class="flex">
                                <span class="label">Outs</span>
                                <span class="icon"><i class="fa-solid fa-right-from-bracket"></i></span>
                            </li>
                            <g:set var="outs" value="${Outs?.list()}"/>
                            <li class="value">${outs?.size()}</li>
                        </div>
                    </div>
                    <div class="image">
                        <asset:image src="picture.png" alt="Image de fundo"/>
                    </div>
                </div>
            </div>

            <!--div id="controllers" role="navigation">
                <h2>Available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller">
                            <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                        </li>
                    </g:each>
                </ul>
            </div-->
        </section>
    </div>
</body>
</html>
