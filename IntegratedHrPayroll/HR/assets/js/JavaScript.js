const link1 = document.querySelector('.dashboard-link1');
const link2 = document.querySelector('.dashboard-link2');
const shareholdersDiv = document.querySelector('.dashboard-shareholders');
const employeeDiv = document.querySelector('.dashboard-employee');

link1.addEventListener('click', function(event) {
    employeeDiv.classList.add('unable-display');
    shareholdersDiv.classList.remove('unable-display');
    link1.classList.add('link-active');
    link2.classList.remove('link-active');
});

link2.addEventListener('click', function(event) {
    shareholdersDiv.classList.add('unable-display');
    employeeDiv.classList.remove('unable-display');
    link2.classList.add('link-active');
    link1.classList.remove('link-active');
});

const ctx = document.getElementById('myChart');
console.log(ctx)

new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

