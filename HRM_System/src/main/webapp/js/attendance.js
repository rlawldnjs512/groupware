
/*
document.addEventListener('DOMContentLoaded', function() {
    const clockOut = document.getElementById('clockOut'); 

    clockOut.addEventListener('click', function() {
        const currentTime = new Date();
        const exitHour = currentTime.getHours();
        const exitMinute = currentTime.getMinutes();

        // 18시 이전 퇴근 시,
        if (exitHour < 18 || (exitHour == 18 && exitMinute == 0)) {
			
			if(confirm("현재 18시 이전입니다. 퇴근하시겠습니까?")) {
				if(confirm("보상시간을 사용하시겠습니까?")) {
					$.ajax({
						url:'/updateAttendance',
						method:'POST',
						dataType:'json',
						success: function(data){
							if(data.status === 'success'){
								alert("퇴근 기록이 정상적으로 저장되었습니다.");
								window.location.href='/attendanceListByEmpId';
							} else {
								alert("오류:" + data.message);
							}
						},
						error: function(error){
							alert("오류 발생");
						}
					});
				}
			}
        } else {
            window.location.href = '/updateAttendance';
        }
    });
});

*/