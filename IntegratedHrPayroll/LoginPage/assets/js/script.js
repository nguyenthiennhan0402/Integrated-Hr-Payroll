const container = document.querySelector('.box-container');
const loginBtn = document.querySelector('.btn-log');
const closeBtn = document.querySelector('.icon-close');

loginBtn.addEventListener('click', ()=>{
    container.classList.add('active-popup');
});

closeBtn.addEventListener('click', ()=>{
    container.classList.remove('active-popup');
});