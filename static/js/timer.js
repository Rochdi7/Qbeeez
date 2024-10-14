document.addEventListener('DOMContentLoaded', () => {
    const timerDisplay = document.getElementById('timer-display');
    const pauseButton = document.getElementById('pause-btn');
    const resumeButton = document.getElementById('resume-btn');
    const resetButton = document.getElementById('reset-timer');
    let elapsedSeconds = localStorage.getItem('timeElapsed') ? parseInt(localStorage.getItem('timeElapsed')) : 0;
    let timerInterval;

    // Update the timer display
    function updateTimer() {
        const minutes = Math.floor(elapsedSeconds / 60);
        const seconds = elapsedSeconds % 60;
        timerDisplay.textContent = `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
    }

    // Timer increment function
    function increment() {
        elapsedSeconds++;
        localStorage.setItem('timeElapsed', elapsedSeconds); // Store the elapsed time locally
        updateTimer();
    }

    // Start the timer
    function startTimer() {
        if (!timerInterval) { // Prevent multiple intervals
            timerInterval = setInterval(increment, 1000);
        }
    }

    // Pause the timer
    function pauseTimer() {
        clearInterval(timerInterval);
        timerInterval = null; // Clear the interval variable
        pauseButton.style.display = 'none';
        resumeButton.style.display = 'inline';
    }

    // Resume the timer
    function resumeTimer() {
        startTimer();
        pauseButton.style.display = 'inline';
        resumeButton.style.display = 'none';
    }

    // Reset the timer
    function resetTimer() {
        clearInterval(timerInterval); // Stop the timer
        timerInterval = null; // Clear the interval variable
        elapsedSeconds = 0; // Reset the elapsed time
        localStorage.removeItem('timeElapsed'); // Remove stored time in localStorage
        updateTimer(); // Update the display to show 00:00
        startTimer(); // Start the timer immediately after resetting
        pauseButton.style.display = 'inline'; // Show pause button
        resumeButton.style.display = 'none'; // Hide resume button
    }

    // Event listener for saving time when the quiz ends or when necessary
    window.addEventListener('beforeunload', () => {
        localStorage.setItem('timeElapsed', elapsedSeconds); // Save time before page unload
    });

    // Initialize the timer display and start the timer
    updateTimer();
    startTimer();

    // Event listeners for buttons
    pauseButton.addEventListener('click', pauseTimer);
    resumeButton.addEventListener('click', resumeTimer);
    resetButton.addEventListener('click', resetTimer);
});


// question 
function toggleQuestionInfo(icon) {
    const infoSection = icon.nextElementSibling; // Select the next sibling element which contains the spans
    infoSection.classList.toggle('collapsed'); // Toggle visibility
    icon.classList.toggle('fa-chevron-up'); // Change icon to down
    icon.classList.toggle('fa-chevron-down'); // Change icon to up
}