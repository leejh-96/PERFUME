<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  <script src="./js/jquery-3.6.3.js"></script>
  <script src="./slick/slick.min.js"></script>

  <link rel="stylesheet" href="./slick/slick-theme.css">
  <link rel="stylesheet" href="./slick/slick.css">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans&family=Open+Sans&display=swap');
    
        div * {
            /* border: 2px solid red; */
            box-sizing: border-box;
            
        }

        body {
            /* background-color: #f6f6f2; */
        }
        #section2_1{
            font-family: 'Nanum Myeongjo', serif;
        /* background-color: #f6f6f2; */
        }
        .wrap {
            width:100%;
            height:3500px;
            margin:auto;
        }

        #header{
            height: 2%;
            
            background-color: white;
            /* position: fixed; */
            
          
        }

        #header1{ width: 30%;}
        #navigator{ width: 50%; }
        #header2{ width: 20%; }
        #header>div {
            float: left;
            height: 100%;
        }

        #section {
            height: 90%;
            
        }

        #footer {
            height: 8%;
            background-color: rgb(157, 226, 203);
        
        }
        #section1 {height: 15%;
             /* border-bottom: 1px solid;  */
             background-color: rgb(54, 58, 62);
             font-size: small; }
          #section2 {height: 85%; } 

        /* #section3 {height: 8%; text-align: center;}

        #section4 {height: 10%;}

        #section5 {height: 45%;} */
       

       #section2>div {height: 100%; float: left;}
       #aside1 {width: 12%;}
       #section2_1 {width: 76%;}
       #aside2 {width: 12%;}

       #s1 {height: 2%;}
       #s2 {height: 3%; }
       #s3 {height: 7%; }    
       #s4 {height: 13%; text-align: center;}
       #s5 {height: 11%;}
       #s6 {height: 64%; border-top: 2px;}

       #s3>div {float: left; height: 100%;}
       #s3_1 {width: 33%;}
       #s3_2 {width: 34%; font-size: smaller;}
       #s3_3 {width: 33%;}

       #s5_product {height: 50%;font-size: 25px; font-weight: bold;}
       #s5_button {height: 15%; text-align: center;}
       #s5_brand {height: 20%;  }
       #productfilter { height: 15%; border-top: 1px solid #ccc; text-align: right; }
       
       #s5_button>div {float: left; height: 100%;}
   

       #s5_brand>div { float: left; height: 100%;}
    

       #listwrap {height: 80%;}
       #pagebar {height: 20%; text-align: center;}



        

        #navi{
            list-style-type: none;
            margin:0;
            padding:0;
            height:100%;
            
        }

        #navi>li{
            float:left;
            width:25%;
            height:100%;
            text-align:center;
            font-size:11px;
            line-height:35px;
           
        }

        #navi a{
            text-decoration: none;
            font-size: 1.4em;
            font-weight: 900;
            height: 100%;
            line-height: 3;
        }

        #navi a:hover{
            color: darkblue;
        }

        #navi>li>ul{
            list-style-type: none;
            padding: 0;
            display: none;
        }

        #navi>li>a:hover+ul{
            display: block;
        }

        #navi>li>ul:hover {
            display: block;
        }

        #navi>li>ul a{
            font-size: 1.4em;
        }

        h2 {
            line-height: 0;
        }

        a{  
        text-decoration: none;
        font-size: 13px;
        font-weight: 900;
        line-height: 3.5;
        }

        a:hover {
        text-decoration : none;
        font-size: 11px;
        }

    #scent {
    font-size: 25px;
    font-weight: bold;
    }
    
    
    .gender {
    width: 39%; 
    height: 100%; 
    font-size: 16px;
	border: 1px solid #ccc;
	color: #333;
	border-radius: 5px;
	outline: none;
    background-color: white;
	vertical-align: top;
    }
    
    .gender:hover {
        opacity:0.9;
    }



       #scents {
            /* padding: 10px; */
            /* box-sizing: border-box; */
            width: 130px;
            height: 110px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            /* padding: 0; */
            letter-spacing: -0.05em;
            outline: none;
            border-radius: 15px;
            color: #fff;
            font-size: 15px;
            line-height: 54px;
        }

        .listproduct {
            width: 23%;
            height: 40%;
    
        }

        #scent-detail {
            height: 60%;
            font-size:12px;
        }

        #button-area {
            height: 40%;
        }
        #scent-detail-button{
            font-size: 13px;
            border: 1px solid #ccc;
            color: white;
            border-radius: 10px;
            background-color: #f6f6f2;
            outline: none;
            vertical-align: top;
            background-color: rgb(216, 201, 134);
        }

    .card {
       
        margin:15px;
        border: none;
        /* background-color: #f6f6f2; */
        text-align: left;
        font-weight: bold;
    }

    


    .card-text {
        font-size: smaller;
    }

    .scent-text {
        position: absolute;
        top: 90px;
        left: 20px;
        z-index: 1;
    
    }

    #d1 {
        width: 30%;
    }

    #d2 {
        width: 30%;
    }

    

    .row { margin: 20px;}
    #s4>div {height: 100%; float: left;}
    
    #brand-select{height: 100%; }


    #d3 { width: 10%;}
    #d4 { width: 10%;}
    #scent-list {width: 80%; }
    
    .slick-arrow{
        background-color: black;
        font-size: 20px;
}
/* .slick-list {
  padding: 10px;
} */

    .spinner-wrapper{
       top: 0;
       left: 0;
       width: 100%;
       height: 30%;
       z-index: 9999;
       display: flex;
       justify-content: center;
       align-items: center;
       transition: all 2s;
    }  

    .spinner-wrapper2{
       top: 0;
       left: 0;
       width: 100%;
       height: 30%;
       z-index: 9999;
       display: flex;
       justify-content: center;
       align-items: center;
       transition: all 2s;
    }  

    .spinner-border {
        height: 40px;
        width: 40px;
    }

    .etcsymbols{ text-align: center; background-color: white;} 
    .p-status{text-align: right;}


    .link {
        color: #333;
        font-size: 11px;
    }

 

    .slider .slick-list {
    margin:0 -20px;
}

.slick-slide {
    margin:0 20px;
}

.scentname {width: 100%; background-color: white; opacity: 0.8; text-align: center; font-weight: bold;  } 

    .banner>div{ height: 80%;float: left;}
    .btn_best {
        width: 50%;
        
    }

    .btn_sale {
        width: 50%;
    }


    .center {height: 50%;}
    .banner {height:50%;}

    #btn_wrap {padding: 10px; height: 100%;}
    #btn_wrap>img{height: 100%; width: 100%;}


    #s5_productwrap {height: 40%;}
    #d7 {height: 60%;}


    </style>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="header1">
                <h2 align="center">planner</h2>
            </div>
            <div id="navigator">
                <ul id="navi">
                    <li><a href="#">menu1</a></li>
                    <li>
                        <a href="#">menu2</a>
                        <ul>
                            <li><a href="#">x</a></li>
                            <li><a href="#">x</a></li>
                            <li><a href="#">x</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">menu3</a>
                        <ul>
                            <li><a href="#">x</a></li>
                            <li><a href="#">x</a></li>
                            <li><a href="#">x</a></li>
                        </ul>
                    </li>
                    <li><a href="#">menu4</a></li>
                </ul>
            </div>
            <div id="header2">
                <a href="#" id="login">Log In</a>
            </div>
        </div>

        <div id="section">
            <div id="section1">
               <img src="">
            </div>
            <div id="section2">
                <div id="aside1">

                </div>
                <div id="section2_1">
                    <div id="s1">

                    </div>
                    <div id="s2" style="position: relative;">
                        <div style="position: absolute; height: 100%;">
                            <p></p>   
                        </div>
                        <p id="scent" align="center">${scent.ptname }</p>
                        
                    </div>
                        
                    <div id="s3">
                        <div id="s3_1">

                        </div>
                        <div id="s3_2" style="text-align:center; position: relative;">
                            <div id="scent-detail">
                                ${scent.ptdetail }
                            </div>
                            <div class="spinner-wrapper2" style="position: absolute; display: none;">
                                <div class="spinner-border" role="status">
                                    <span class="sr-only">Loading...</span>
                                  </div>
                                </div>
                          
                            <div id="button-area" >
                                <button type="button" id="scent-detail-button">more detail</button>
                               
                            </div>    
                            </div>
                        
                        <div id="s3_3">
                            
                        </div>
                    </div>
                    <div id="s4">
                        <div id="d3">
                        </div>
                        <div id="scent-list">
                            <div class="center" data-id="${listCount2}">
                            	<c:forEach var="topcate" items="${ topcate }">
                                <div class="scentcate" style="position: relative;" data-id="${topcate.ptno}" ><div class="scentname" style="position: absolute; bottom:0;">${topcate.ptname}</div>
                               <a href="${ path }/scent?no=${topcate.ptno}"> <button type="button"id="scents" style="background-color: rgb(233, 203, 89);" value="${topcate.ptno}"></button></a>
                                </div>
                               	</c:forEach>
                            </div>
                            <div class="banner">
                            <div class="btn_best">
                                <div id="btn_wrap" style="position: relative;">
                                    <div style="position: absolute; color: black;  width: 100%; text-align: left; bottom: 20px;">
                                        <h6 style="font-size: 25px; font-weight: bold;">BEST PRODUCT</h6>
                                    </div>
                                    <img src="https://img.freepik.com/premium-photo/medicinal-herbs-and-tinctures-homeopathy-selective-focus_73944-28706.jpg?size=626&ext=jpg&ga=GA1.1.686292353.1680604484&semt=sph" class="" alt="...">
                                    
                                </div>
                            </div>
                            <div class="btn_sale">
                                <div id="btn_wrap" style="position: relative;">
                                    <div style="position: absolute; color: gray; font-weight: bold; width: 100%; text-align: left; bottom: 20px;">
                                        <h6 style="font-size: 25px; font-weight: bold;">SALE PRODUCT</h6>
                                    </div>
                                    <img src="https://img.freepik.com/free-photo/top-view-closeup-of-white-daisy-flowers-floating-on-the-water_181624-38043.jpg?size=626&ext=jpg&ga=GA1.1.686292353.1680604484&semt=sph" class="" alt="..." >
                                </div>
                            </div>
                            </div>
                        </div>
                        <div id="d4">

                        </div>



                    </div>

                  
                    <div id="s5">
                        <div id="s5_product">
                        <div id="d7">
                        </div>
                        <div id="s5_productwrap">
                            <div align="center">
                                PERFUME
                                </div>
                        </div>
                    </div>
                        <div id="s5_button">
                            
                            <button class="gender" type="button" id="">FEMME</button> &nbsp; &nbsp;
                            <button class="gender" type="button">HOMME</button> 
                        </div>
                        <div id="s5_brand">
                            <!-- <p id="scent"><mark  style="background-color: rgb(243, 239, 236)"> BRAND</mark>  </p> -->
                            <table id="brand-select">
                            <tr>
                                <th  width="100px">BRAND</th>
                                <td ><label><input type="checkbox" name="color" value="blue">겔랑</label>
                                </td>
                                <td ><label><input type="checkbox" name="color" value="blue">구찌</label>
                                </td>
                                <td ><label><input type="checkbox" name="color" value="blue">끌로에</label>
                                </td>
                                <td ><label><input type="checkbox" name="color" value="blue">나소마토</label>
                                </td>
                                <td ><label><input type="checkbox" name="color" value="blue">돌체앤가바나</label>
                                </td>
                            </tr>
                            </table>
                        </div>
                        
                        <div id="productfilter">
                            <a class="link"	href="#link" > 최신 상품 </a> <span class="bar">|</span> 
							<a class="link"	href="#link"> 낮은 가격 </a> <span class="bar">|</span>
							<a class="link"	href="#link"> 높은 가격 </a> <span class="bar">|</span>
							<a class="link"	href="#link"> 사용 후기</a>
                        </div>
                       
                    </div>
                    <div id="s6" >
                      
                      
                      
                    
                      
                        <div id="listwrap" style="position: relative;">   
                            <div class="spinner-wrapper" style="position: absolute; display: none;"  >
                                <div class="spinner-border" role="status">
                                    <span class="sr-only">Loading...</span>
                                  </div>
                                </div>
                            <div class="row" >
                                    <c:forEach var="product" items="${ product }">
                                <div class="col-sm-6 col-lg-3">
                     
                                    <div class="card">
                                        <div style="position: relative;"> <a href="${ path }/detail?no=${product.pno }"> <img src="https://eco-beauty.dior.com/dw/image/v2/BDGF_PRD/on/demandware.static/-/Sites-master_dior/default/dw09c1c618/assets/Y0479201/Y0479201_F047924709_E01_GHC.jpg?sw=460&sh=498&sm=fit&imwidth=460" class="card-img-top" alt="..." > </a></div>
                                        <div class="p-status"style="position: absolute; width: 100%;">
                                            <span class="badge badge-danger">NEW</span>
                                        </div>
                                        <div class="etcsymbols"style="position: absolute; width: 100%; height: 8%; bottom: 170px ">
                                            <span class="material-symbols-outlined">favorite</span>&nbsp;&nbsp;
                                            <span class="material-symbols-outlined">shopping_cart</span>&nbsp;&nbsp;
                                            <span class="material-symbols-outlined">share</span>
                                        </div>
                                        <hr>
                                        <div>
                                       <h5>${product.name } </h5>
                                       <p class="card-text">${product.title }</p>
                                       <p class="card-text">${product.eng } <span>won</span></p> 
                                        </div>
                                        <hr>
                                        
                                      </div>
                                      </div>
                                </c:forEach>
                                   
                                </div>  
                             
                                



                            </div>

                        </div>
                        <div id="pagebar">
                            <input type="search">
                            <br>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                  <li class="page-item disabled">
                                    <a class="page-link">Previous</a>
                                  </li>
                                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                                  <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                  </li>
                                </ul>
                              </nav>
                        </div>
                    </div>
                </div>
                <div id="aside2">
                </div>
            </div>
        </div>
        <div id="footer">

        </div>
    </div>
</body>



<script>

//        $('.scent1').click(function() {
       
//        var no = $(this).val();
//        	console.log(no);
       
// 		   	$.ajax({
// 				type: 'GET',
// 				url: '${ path }/topcate',
// 				dataType: 'json',
// 				data: {
// 					no
// 				},
// 				success: (obj) => {
					
// 					let result = '';
				
// 					console.log(obj);
					
// 					if(obj !== null) {
// 						result = obj.ptname;
// 						console.log(result);
// 					}
		
				
// 				},
// 		   	error: (error) => {
// 				console.log(error);	
// 			}
       
       
       
       
       
 
//        });
    
    
//        }); 
    
    
    
    
    
    
    
    var gender = document.getElementsByClassName('gender');
    

    for (var i = 0; i < gender.length; i++) {
        gender[i].addEventListener('click', function(){
        for (var j = 0; j < gender.length; j++) {
            
            
            gender[j].style. fontWeight= "100";
            gender[j].style.backgroundColor= "white";
            gender[j].style.color = "rgbrgb(190, 190, 190)";
            gender[j].style.borderColor="rgb(190, 190, 190)";

        }
        this.style.fontWeight = "700";
        this.style.color = "black";
        this.style.backgroundColor ="white";
        this.style.borderColor="black";
        
      })
    }




    $(document).ready( function() {
        var id = $(".center").attr('data-id') -1;
        $('.center').slick({
  dots: true,
  infinite: false,
  speed: 300,
  slidesToShow: id,
  slidesToScroll: 1
  
});
  
	
  } );

   
    $(document).ready(function() {
    $(".gender").on({
        "click":function(){
            $(".spinner-wrapper").show().delay(500).fadeOut(300);
            $(".row").hide().delay(600).fadeIn(400);

           
        }

    

    });

    $(".link").on({
        "click":function(){
            $(".spinner-wrapper").show().delay(500).fadeOut(300);
            $(".row").hide().delay(600).fadeIn(400);
    }

    });


    $(".scentcate").on({
        "click":function(){
            $(".spinner-wrapper2").show().delay(500).fadeOut(300);
            $("#scent-detail").hide().delay(600).fadeIn(400);
            $("#button-area").hide().delay(600).fadeIn(400);
            $("#scent").hide().delay(600).fadeIn(400);
    }


    });

});

 
   

  
  $(".card-img-top").on({
    "mouseover":function(){
       
        $(this).css({'opacity':'0.5'});
        $(".etcsymbols").fadeIn(200);
        // $(".etcsymbols").css({'opacity':'0.5'});



    },
    "mouseout":function(){
        $(this).css({'opacity':'1'});
        $(".etcsymbols").fadeOut(200);

    }


  });

  $(".scentcate").on({
    "mouseover":function(){
       
       $(this).css({'opacity':'0.8'});
    



   },
   "mouseout":function(){
       $(this).css({'opacity':'1'});

   }

  });
</script>
</html>