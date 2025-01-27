<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>뉴스 검색</title>
</head>
<body>
<div>실시간 검색 순위</div>
<div class="search_test"></div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
                       $.ajax({
                    	url: "http://192.168.0.57:8080/searchcount",
                    	type: "GET",
                    	dataType: "JSON",
                    	success: function(data2) {
                    	    test = data2['aggregations']
                  			console.log(test);
                    	    test2 = test['sterms#group_by_word'];
                  			for(var i=0; i<test2['buckets'].length; i++){
                    			$(".search_test").append("<div class ='search_test2'>" + i +". "+ test2['buckets'][i]['key'] + "</div>" );           
                    		}
                    	}
                  	});

  
  $(function() {
		$('.search-submit').click(function(){
		console.log($('#searchkeyword').val())
					title = new Array;
					url = new Array;
			        $.ajax({
                    url: "http://192.168.0.57:8080/searchmatchparse",
                    type: "GET",
                    dataType: "JSON",
                    data: { "id" : $('#searchkeyword').val()},
                    success: function(data) {
                     $.ajax({
                    	url: "http://192.168.0.57:8080/upsert",
                    	type: "GET",
                    	dataType: "JSON",
                    	data: { "id" : $('#searchkeyword').val()},
                    	success: function(data2) {
                    		}
                  		});
                    	test = data['hits']
                    	test2 = test['hits']
                    	$('.title').remove();
                    	$('.url').remove();
                    	$('.word').remove();
                    	for(var i=0; i<test2.length; i++){
                    		$(".search-result").append("<div class ='title'>" + test2[i]['_source']['title'] +"</div>" );
                    		$(".search-result").append("<a class='url' href ="+url[i]+'>' + test2[i]['_source']['url'] +"</div>" );
                    	}

						
                    }
                  });
                 });
                         
        $('#searchkeyword').keydown(function(event){
		console.log($('#searchkeyword').val())
			        $.ajax({
                    url: "http://192.168.0.57:8080/searchworkdkeyword",
                    type: "GET",
                    dataType: "JSON",
                    data: { "id" : $('#searchkeyword').val()},
                    success: function(data) {                 
                    	test = data['hits']
                    	test2 = test['hits']
                    	event.preventDefault();
                 		event.stopPropagation();
                    	$('.word').remove();
                    	for(var i=0; i<test2.length; i++){
                    		$(".search-result").append("<div class ='word'>" + test2[i]['_source']['word'] +"</div>" );
                    	}
						
                    }
                 });
                 });
             });
		
		


</script>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<!-- XEIcon 폰트 불러오기 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<div class="search-popup">
    <h2 class="tt">검색</h2>
    <form action="#" class="search-form" role="search">
        <fieldset>
            <legend>검색창</legend>
            <div class="search-form-con">
                <label class="blind" for="#">검색</label>
                <input type="text" id='searchkeyword' name="search" placeholder="뉴스 검색">
                <button type="button" class="search-submit">검색</button>
            </div>
        </fieldset>
    </form>

    <div class="search-result-wrap">
    	<div> 연관 검색어 </div>
    	<br/>
        <div class="search-result">

        </div>
    </div>
</div>
<br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>
<br/>
<br/>
<br/>
<br/>
<iframe src="http://192.168.56.101:5601/app/visualize#/edit/5c68cc80-6eb5-11eb-8a82-236548a2705d?embed=true&_g=(filters%3A!()%2CrefreshInterval%3A(pause%3A!f%2Cvalue%3A10000)%2Ctime%3A(from%3A'2021-02-01T12%3A55%3A08.907Z'%2Cto%3Anow))" height="600" width="800"></iframe>

<iframe src="http://192.168.56.101:5601/app/dashboards#/view/68738b60-6284-11eb-b23d-9b0c7a5ca6b1?embed=true&_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:'2021-01-05T11:02:25.846Z',to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!t),query:(language:kuery,query:''),timeRestore:!f,title:%ED%94%84%EB%9D%BC%EB%8B%AD,viewMode:view)" height="600" width="800"></iframe>
</body>
</html>