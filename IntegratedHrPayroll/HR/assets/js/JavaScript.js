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



