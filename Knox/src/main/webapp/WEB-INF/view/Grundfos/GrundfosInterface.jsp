<%--
  Created by IntelliJ IDEA.
  User: teisv
  Date: 27-10-2020
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="../common/html_head.jspf"%>
<body>
<%@ include file="../common/header.jspf"%>
<div class="maincontent_wrapper">
    <div class="maincontent">
        <div id="headlineWrapper">
            <div id="headline">
                <h1>Grundfos</h1>
            </div>
        </div>
        <div id="searchbar">
                <input id="search_input" class="search_input" type="text" name="searched" placeholder="Search..." >
                <spring:url value="/resources/icons/search-solid.svg" var="search_solid" />
                <a id="search_button" class="search_icon button_link">
                    <img src="${search_solid}">
                </a>
        </div>
        <div id="searchWrapper">
            <!--
            <c:forEach items="${ddHash}" var="dummydata">
                <a href ="/knox/grundfos/search?article=${dummydata.key}" class="button_link searchResult">
                    <div >
                        <h1 id="articletitle">${dummydata.value.title} </h1>
                        <h2 id="articlesub">${dummydata.value.subtitle}</h2>
                        <p  id="author">${dummydata.value.author}</p>
                        <p  id="date">${dummydata.value.date}</p>
                        <p  id="articletext">${dummydata.value.articleText}</p>
                        <p  id="keywods">   </p>
                    </div>
                </a>
            </c:forEach>
            -->
        </div>
    </div>




    <div id="sidebar" class="grundfos">
        <div class="sidebar_wrapper">

            <div class="sidebar_component">
                <h2 > Filter by</h2>
                <div class="checkbox">
                    <ul class="nobullets">
                        <li>
                            <label>
                                <p class="sidebar_option_text">Grundfos</p>
                                <input type="checkbox" id="option0" name="Grundfos">
                            </label>
                        </li>
                        <li>
                            <label>
                                <p class="sidebar_option_text">Nordjyske</p>
                                <input type="checkbox" id="option1" name="Nordjyske"">
                            </label>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var SearchContentWrapper = document.getElementById("searchWrapper")
    let NumberOfDatasets = 2;


    $('#search_button').click(function() {
        var search = {search:document.getElementById("search_input").value };
        console.log(search);
        console.log(search1);
        console.log(search2);
        PostCall("grundfossearch",search, SearchCallBack);
        console.log("Searching...");
    });

    $(document).keyup(function (e) {
        if ($('.search_input').is(":focus") && (e.keyCode == 13)) {
            var search = {search:document.getElementById("search_input").value };
            //GetRequest(SearchOptions(search));
            CheckBoxes();
        }
    });
    function SearchCallBack (result) {
        console.log("CallBack");
        console.log(result);
        var manualElements = convertGrundfosToHtml(result);
        console.log(manualElements);
        // Clear current search result
        SearchContentWrapper.innerHTML = '';
        // Add search result
        for(var i = 0; i < manualElements.length; i++){
            SearchContentWrapper.appendChild(manualElements[i]);
        }
    }

    function CheckBoxes(){
        var dict = [];

        for(var i = 0; i<NumberOfDatasets; i++) { //Number of datasets is defined at the top of the script, but should probably be dynamicly calculated in the future
            let tempobj = document.getElementById("option"+i);
            dict.push({
                key: tempobj.getAttribute("name"),
                value: tempobj.checked
            });
        }
        console.log(dict);
    }


</script>
</body>
</html>
