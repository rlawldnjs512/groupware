
var reservationData;
var revSpan;
var modal;
    document.addEventListener("DOMContentLoaded", function () {

    	// TODO 002 --Start-- span 이벤트를 저리할 함수
    	function handleClick() {
            // 1. 클릭된 span 요소의 텍스트를 콘솔에 출력
            revSpan =  this;
            
            var range =  this.textContent
            console.log("클릭한 예약 시간: " + range);
            
            var slot = this.getAttribute("name")
            console.log("클릭한 slot : " + slot);
            
            var rev_date = document.getElementById("rev_date").value;
            console.log("예약 날짜: " + rev_date);
            
			var roomName = this.parentNode.parentNode.children[0].textContent;
            console.log("예약 회의실: " + roomName);
            
			var room_id = this.parentNode.parentNode.id
            console.log("예약 회의실 ID: " + room_id);
            
            var emp_name = document.getElementById("emp_name").value;
            
            var emp_id = document.getElementById("emp_id").value;

			document.getElementById("time").value = range;
			document.getElementById("date").value = rev_date;
			document.getElementById("name").value = emp_name;
			document.getElementById("room").value= roomName;
			
// 2. 전송 데이터 생성
// 				FormData 객체 생성
// 				var formData = new FormData();
// 				formData.append("range", range);
// 				formData.append("slot", slot);
// 				formData.append("revDate", revDate);
// 				formData.append("roomName", roomName);
// 				formData.append("roomId", roomId);
// 				console.log(stringify(formData))

			// 일반 객체 생성
			reservationData = {
			    range: range,
			    slot: slot,
			    rev_date: rev_date,
			    roomName: roomName,
			    room_id: room_id,
			    emp_name: emp_name,
			    emp_id: emp_id
			};
			// JSON 문자열로 변환
			var jsonData = JSON.stringify(reservationData);
			console.log("JSON 데이터: " + jsonData);
            
// 				
			
            modal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
            modal.show();
            
            
            // TODO 003 --Start-- 데이터를 revSubmit 서버에 전송하고 span 이벤트를 제거
            document.getElementById('revSubmit').onclick = async () => {
                // 이벤트 리스너 제거
                
//                 let chk  = confirm("확인은 ajax동작 성공을 나타낸다");
//                 console.log(chk, typeof chk);
                
                let chk = await  ajaxSubmit();
                console.log(chk , typeof chk)
                if(chk){
                //  예약완료 후  Span Css  변경
    				var className1=  this.className;
    				console.log("this 클래스 전: " + className1);
    				this.classList.toggle("nocheck");
    				var className2=  this.className;
    				console.log("this 클래스 후: " + className2);
    				this.classList.add("check");
    				var className3=  this.className;
    				console.log("this 클래스 후: " + className3);
                    
                    this.removeEventListener('click', handleClick);
                    modal.hide();  // 모달을 닫음
				}
                
              };
           // TODO 003 --EDN-- 데이터를 서버에 전송하고 span 이벤트를 제거
            
    	}
    	// TODO 002 --End-- span 이벤트를 저리할 함수
    	
    	
		// TOD0 001 --Start-- span에 click 이벤트     	
        document.querySelectorAll(".reservation-container span.nocheck").forEach(function (span) {
            span.addEventListener("click",handleClick);
        });
     	// TOD0 001 --End-- span에 click 이벤트     	
        
        var date = new Date();
        var year = String(date.getFullYear());
        var month = String(date.getMonth()+1).padStart(2,'0');
        var day = String(date.getDate()).padStart(2,'0');

       
        console.log(year, typeof year);
        console.log(month, typeof month);
        console.log(day, typeof day);
     	
        var graveEx = year+"-"+month+"-"+day
        console.log(graveEx, typeof graveEx);
     	
        document.getElementById("rev_date").value = graveEx
        
    }); // onload End
    
    
    var ajaxSubmit  = async function(){
            console.log("전송 데이터:", reservationData);
            try {
                const response = await fetch("./insertReserv.do", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(reservationData)
                });

                const data = await response.json();

                if (data.isc) {
                    alert("예약이 완료되었습니다!");
                    
                } else {
                    alert("예약에 실패했습니다. 다시 시도해주세요.");
                    
                }
                
                return data;
            } catch (error) {
                console.error("예약 실패:", error);
                alert("예약에 실패했습니다. 다시 시도해주세요.");
                return data;
            }
            
            
    }
    
    
