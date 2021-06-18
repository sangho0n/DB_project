<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>search</title>
    <style>
    .overlay {
    position:relative;
	background-color: white;
	}
    </style>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
 

<input id="all_mak" type="button" value="모두" />
<input id="mak_show1" type="button" value="0~1.5" />
<input id="mak_show2" type="button" value="1.5~3" />
<input id="mak_show3" type="button" value="3" />


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49a3d864a0e9d5155ce5c4014ddbdc7d&libraries=services"></script>

<script>
let markers1=[],markers2=[],markers3=[];
let end_markers=[];
let marker_ok=[];
let custom_arr=[],custom_arr1=[];
let cnt_0=0,cnt_1=0,cnt_2=0,cnt_3=0;
let click_cnt=0;

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.45356, 126.69385), // 지도의 중심좌표
        level: 11 // 지도의 확대 레벨
    };

let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} 


// 마커가 지도 위에 표시되도록 설정합니다
//marker.setMap(map);  
function displayMarker(locPosition, message) {

	var imageSrc = 	var imageSrc = 'styles/images/map-marker-icon_34392.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(45, 45); // 마커이미지의 크기입니다
  
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	   
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: locPosition, 
	    image: markerImage, // 마커이미지 설정 
	    map:map
	});
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}


//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(marker,i,content) {
 return function() {
     if(click_cnt==0){
    	 custom_arr[i].setMap(map);
    	 custom_arr1[i].setMap(map);
    	 
    	 content.onclick = function() { 
    		custom_arr1[i].setZIndex(2);
    		custom_arr[i].setZIndex(0);
    	}

	     end_markers[i].setVisible(true);
	 
	     set_V_Markers(false,markers1);
	     set_V_Markers(false,markers2);
	     set_V_Markers(false,markers3);
	    
	     marker.setVisible(true);

     }
  else{
    	 custom_arr[i].setMap(null);
    	 custom_arr1[i].setMap(null);
    	 end_markers[i].setVisible(false);
	     
    	 if(!cnt_0){
    	    set_V_Markers(true,markers1);
    	    set_V_Markers(true,markers2);
    	    set_V_Markers(true,markers3);
    	  }
    	          
    	 else if(cnt_1==1){
    	    set_V_Markers(true,markers1);
    	  }
    	 else if(cnt_2==1){
    	    set_V_Markers(true,markers2);
    	  }
    	 else if(cnt_3==1){
    	    set_V_Markers(true,markers3);
    	  }

     }
     click_cnt=!click_cnt;
 };
}



//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map,markers) {
   if(markers[0].map==null){
         markers.forEach(function(item){
         item.setMap(map);
      })   
   }
}
function set_V_Markers(value,markers){
   markers.forEach(function(item){
       item.setVisible(value); 
   })
}

$.getJSON('DB/bicycle_road.json', function(data) {
   
   let end_cnt=0;

     for(let i=0;i<data.length;i++){
        //주소로 좌표를 검색
         geocoder.addressSearch(data[i].end_point, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                 let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                 
                 let content = document.createElement('div');
                 content.className = 'overlay';
                 content.innerHTML = '도착:'+data[i].end_point;
                 
                 let customOverlay = new kakao.maps.CustomOverlay({
                	 position: coords,
                	 content: content,
                	 yAnchor: 3,
                	 zIndex:2
                  });
                 
                 custom_arr[i]=customOverlay;

                  // 결과값으로 받은 위치를 마커로 표시합니다
                  let marker = new kakao.maps.Marker({
                      map: map,
                      position: coords
                  });
                  marker.setVisible(false);
                  end_markers[i]=marker;
                  
                  marker_ok[i]=true;
            }
            
            else{
               marker_ok[i]=false;
            }
            
            end_cnt++;
            
            if(end_cnt==data.length){
               start_point_marker_print();
            }
        });
        
     }
         

   function start_point_marker_print(){

           for(let i=0;i<data.length;i++){
             //주소로 좌표를 검색+마커+인포윈도우
              geocoder.addressSearch(data[i].start_point, function(result, status) {
                  // 정상적으로 검색이 완료됐으면 
                   if (status === kakao.maps.services.Status.OK&&marker_ok[i]===true) {

                        let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
      
                        let content2 = document.createElement('div');
                        content2.className = 'overlay';
                        content2.innerHTML = '출발:'+data[i].start_point+'<br>거리:'+data[i].distance;
                        
                        let customOverlay2 = new kakao.maps.CustomOverlay({
                       	 position: coords,
                       	 content: content2,
                       	 yAnchor: 2,
                       	 zIndex:0
                         });
                        
                        custom_arr1[i]=customOverlay2;

                         // 결과값으로 받은 위치를 마커로 표시합니다
                         let marker = new kakao.maps.Marker({
                             map: map,
                             position: coords
                         });
                        
                         
                         if(data[i].distance<1.5){
                             markers1.push(marker);
                         }
                          else if(data[i].distance<3){
                             markers2.push(marker);
                         }
                          else if(data[i].distance>=3){
                             markers3.push(marker);
                         }

  						kakao.maps.event.addListener(marker, 'click', makeOverListener(marker,i,content2));        
                   }
              });
          }
      
        
     }
});

$(document).ready(function() {
     $('#all_mak').click(function() {
           if(!cnt_0){
               set_V_Markers(false,markers1);
               set_V_Markers(false,markers2);
               set_V_Markers(false,markers3);
                
               console.log("모두버튼 한번누름");
           }
           else{
               set_V_Markers(true,markers1);
               set_V_Markers(true,markers2);
               set_V_Markers(true,markers3);
                 
               console.log("모두버튼 두번누름");
           }
           cnt_0=!cnt_0;
      });
     
     $('#mak_show1').click(function() {
        if(!cnt_1){
            set_V_Markers(true,markers1);
            set_V_Markers(false,markers2);
            set_V_Markers(false,markers3);
   
            console.log("0~1.5버튼 한번누름");
         }
        else{
           set_V_Markers(true,markers2);
           set_V_Markers(true,markers3);
      
           console.log("0~1.5버튼 두번누름");
         }
        cnt_1=!cnt_1;
     });
     $('#mak_show2').click(function() {
        if(!cnt_2){
            set_V_Markers(true,markers2);
            set_V_Markers(false,markers1);
            set_V_Markers(false,markers3);
            
            console.log("1.5~3버튼 한번누름");
         }
        else{
            set_V_Markers(true,markers1);
            set_V_Markers(true,markers3);
           
            console.log("1.5~3버튼 두번누름");
         }
        cnt_2=!cnt_2;
     });
     
     $('#mak_show3').click(function() {
        if(!cnt_3){
            set_V_Markers(true,markers3);
            set_V_Markers(false,markers2);
            set_V_Markers(false,markers1);

            console.log("3버튼 한번누름");
         }
        else{
           set_V_Markers(true,markers1);
           set_V_Markers(true,markers2);
           
           console.log("3버튼 두번누름");
         }
        cnt_3=!cnt_3;
     });  
});
</script>

</body>
</html>