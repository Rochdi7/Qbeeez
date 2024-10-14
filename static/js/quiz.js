const instractionModal = new bootstrap.Modal('#instractionModal', {
    keyboard: false
})
instractionModal.show();


// Get the button and slider elements
const reportButton = document.getElementById('reportButton');
const slider = document.getElementById('slider');
const closeSlider = document.getElementById('closeSlider');

// Open the slider when the button is clicked
reportButton.addEventListener('click', function() {
  slider.classList.add('open');
});

// Close the slider when the close button is clicked
closeSlider.addEventListener('click', function() {
  slider.classList.remove('open');
});

// Fullscreen functionality
const fullscreenBtn = document.getElementById('fullscreen-btn');
const fullscreenIcon = document.getElementById('fullscreen-icon');

fullscreenBtn.addEventListener('click', () => {
    if (!document.fullscreenElement) {
        document.documentElement.requestFullscreen();
        fullscreenIcon.classList.remove('fa-expand');
        fullscreenIcon.classList.add('fa-compress');
    } else {
        if (document.exitFullscreen) {
            document.exitFullscreen();
            fullscreenIcon.classList.remove('fa-compress');
            fullscreenIcon.classList.add('fa-expand');
        }
    }
});

// Timer Variables
const timerDisplay = document.getElementById('timer-display');
const pauseButton = document.getElementById('pause-btn');
const resumeButton = document.getElementById('resume-btn');
let timeElapsed = sessionStorage.getItem('timeElapsed') ? parseInt(sessionStorage.getItem('timeElapsed')) : 0;
let timerInterval;

// Update the timer display
function updateTimer() {
    const minutes = Math.floor(timeElapsed / 60);
    const seconds = timeElapsed % 60;
    timerDisplay.textContent = `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
}

// Timer increment function
function increment() {
    timeElapsed++;
    updateTimer();
    sessionStorage.setItem('timeElapsed', timeElapsed); // Store time in session storage
}

// Start the timer
function startTimer() {
    timerInterval = setInterval(increment, 1000);
}

// Pause the timer
function pauseTimer() {
    clearInterval(timerInterval);
    pauseButton.style.display = 'none';
    resumeButton.style.display = 'inline';
}

// Resume the timer
function resumeTimer() {
    startTimer();
    pauseButton.style.display = 'inline';
    resumeButton.style.display = 'none';
}

// Initialize the timer display
updateTimer();
startTimer();

// Event listeners for pause and resume buttons
pauseButton.addEventListener('click', pauseTimer);
resumeButton.addEventListener('click', resumeTimer);

    document.querySelectorAll('.btn-outline-secondary').forEach(button => {
        button.addEventListener('click', (e) => {
            e.preventDefault();
            const targetId = e.target.getAttribute('href').substring(1);
            document.getElementById(targetId).scrollIntoView({ behavior: 'smooth' });
        });
    });