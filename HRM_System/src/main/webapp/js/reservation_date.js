document.addEventListener("DOMContentLoaded", function () {
    // Handlebars 헬퍼 등록
    Handlebars.registerHelper("eq", function (a, b) {
        return a === b;
    });

    // 예약 데이터를 가져오는 함수
    function fetchReservations(selectedDate) {
        $.ajax({
            url: "./reservationapi.do",
            type: "GET",
            dataType: "json",
            data: { nowDate: selectedDate },
            success: function(response) {
                console.log("응답 타입:", typeof response);
                console.log("응답 데이터:", response);

                var source = document.getElementById("room-template").innerHTML;
                var template = Handlebars.compile(source);
                var html = template(response);

                $("#revContent").html(html);
            },
            error: function(xhr, status, error) {
                console.error("Error fetching reservation data:", error);
            }
        });
    }

    // 날짜 입력 필드 탐색
    var dateInput = document.querySelector("#rev_date");
    

    if (dateInput) {
        // 처음 로드될 때 한 번 실행
        fetchReservations(dateInput.value);

        // 날짜 변경 시 이벤트 추가
        dateInput.addEventListener("change", function () {
            fetchReservations(this.value);
        });
    } else {
        console.error("날짜 입력 필드를 찾을 수 없습니다.");
    }
    
    $(document).ready(function() {
            let currentDate = new Date();

            function updateDateDisplay() {
                const year = currentDate.getFullYear();
                const month = String(currentDate.getMonth() + 1).padStart(2, "0");
                const day = String(currentDate.getDate()).padStart(2, "0");
                $("#date-text").text(`${year}년 ${month}월 ${day}일`);
                $("#rev_date").val(`${year}-${month}-${day}`);
                
                fetchReservations($("#rev_date").val());
            }

            updateDateDisplay();

            $("#today-btn").on("click", function() {
                currentDate = new Date();
                updateDateDisplay();
            });

            $("#prev-day").on("click", function() {
                currentDate.setDate(currentDate.getDate() - 1);
                updateDateDisplay();
            });

            $("#next-day").on("click", function() {
                currentDate.setDate(currentDate.getDate() + 1);
                updateDateDisplay();
            });

            $("#date-display").on("click", function() {
                $("#rev_date")[0].showPicker();
            });

            $("#rev_date").on("change", function() {
                currentDate = new Date(this.value);
                updateDateDisplay();
            });
        });
    
});