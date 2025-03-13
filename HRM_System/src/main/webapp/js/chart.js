document.addEventListener("DOMContentLoaded", function () {
    fetch('/attendance_admin/donutChart')
        .then(response => response.json())
        .then(data => {
            const departmentLabels = data.departmentLabels;  // 부서 이름
            const departmentData = data.departmentData;  // 시간(숫자 형식)
            const formattedData = data.formattedData;  // 시간:분 형식

            // 차트 그리기
            const ctx = document.getElementById("departmentWorkChart").getContext("2d");
            new Chart(ctx, {
                type: "doughnut",
                data: {
                    labels: departmentLabels,
                    datasets: [{
                        data: departmentData,  // 차트에서 사용될 숫자 데이터
                        backgroundColor: [ "#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0", "#9966FF", "#F06292" ],
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: { position: "left" },
                        tooltip: {
                            callbacks: {
                                // O시간 O분 형식으로 표시
                                label: function(tooltipItem) {
                                    return formattedData[tooltipItem.dataIndex];
                                }
                            }
                        }
                    }
                }
            });
        })
        .catch(error => console.error('Error fetching donut chart data:', error));
});