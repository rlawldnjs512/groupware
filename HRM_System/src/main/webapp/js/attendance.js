// 출근버튼
function confirmClockIn(){
	if(confirm("출근하시겠습니까?")){
		document.getElementById("clockIn").submit();
	}
}

document.addEventListener('DOMContentLoaded', function() {
    const clockOut = document.getElementById('clockOut'); 

    clockOut.addEventListener('click', function() {
		
		// 사용자의 보상시간을 가져옴.
		var extraTime = document.getElementById("extraTime").value;
		
		// 현재 시간(퇴근버튼을 누른 시간)
        const currentTime = new Date();
        const exitHour = currentTime.getHours();
        const exitMinute = currentTime.getMinutes();

		var infoAtten = {
			exitHour : "Y",
			useBonusTime : "N"
		}

        // 18시 이전 퇴근 시
        if (exitHour < 18) {
			let checkTime = confirm("현재 18시 이전입니다. 퇴근하시겠습니까?");
			if(checkTime){
				infoAtten.exitHour="N";
			} else { // 취소버튼
				return;
			}
        } else {
			// 정상퇴근
            attendance(infoAtten);
        }
        
        if(extraTime > (18-exitHour)){
			let useBonusTime = confirm("보상시간을 사용하시겠습니까?");
			if(useBonusTime){
				infoAtten.useBonusTime = "Y";
			}
		}
		
        attendance(infoAtten);
        alert("퇴근 기록이 정상적으로 저장되었습니다.");
       
    });
});

function attendance(infoAtten) {
	
	console.log((infoAtten.exitHour == "N" &  infoAtten.useBonusTime=="Y") ? "보상시간 사용하여 퇴근":"");
	console.log((infoAtten.exitHour == "N" &  infoAtten.useBonusTime=="N") ? "조퇴":"");
	console.log((infoAtten.exitHour == "Y" &  infoAtten.useBonusTime=="N") ? "정상퇴근":"");
	
	fetch('./updateAttendance', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(infoAtten) // JSON 데이터 전송
	})
		.then(response => response.json())
		.then(data => {
			console.log(data)
			/*if (data.status === 'success') {
				alert("퇴근 기록이 정상적으로 저장되었습니다.");
				location.href = '/attendanceListByEmpId';
			} else {
				alert("오류: " + data.message);
			}*/
		})
		.catch(error => {
			alert("오류 발생");
			console.error("Error:", error);
		});
}
