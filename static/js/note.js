$(document).ready(function() {
    // Handle note submission
    $('#save-notes-form').on('submit', function(e) {
        e.preventDefault(); // Prevent the form from submitting the normal way

        const editId = $(this).attr('data-edit-id'); // Get the note ID for editing, if any

        $.ajax({
            type: 'POST',
            url: $(this).attr('action'), // Get the action URL from the form
            data: $(this).serialize(), // Serialize the form data
            success: function(response) {
                if (response.success) {
                    // Show success message using SweetAlert
                    swal("Success", "Notes saved successfully!", "success");

                    // Show the notes display area
                    $('#notesDisplay').show(); // Ensure the notes display area is visible

                    if (editId) {
                        // If editing, update the existing note in the list
                        $('#note-' + editId).find('p').text(response.notes); // Update note content
                        $('#note-' + editId).find('small').text('Created at: ' + response.created_at); // Update created timestamp
                    } else {
                        // If not editing, append new notes and created timestamp to the list
                        $('#notesList').append('<li id="note-' + response.note_id + '" class="note-item"><p>' + response.notes + '</p><small>Created at: ' + response.created_at + '</small><button class="btn btn-link edit-note" data-id="' + response.note_id + '" data-notes="' + response.notes + '">🖉 Edit</button></li>');
                    }
                    
                    // Optionally, clear the textarea after saving
                    $('textarea[name="notes"]').val('');
                    $(this).removeAttr('data-edit-id'); // Clear the edit ID after saving
                } else {
                    // Show failure message using SweetAlert
                    swal("Error", "Failed to save notes: " + response.message, "error");
                }
            },
            error: function(xhr) {
                // Show error message as a pop-up using SweetAlert
                swal("Error", 'An error occurred: ' + xhr.responseText, "error");
            }
        });
    });

    // Handle editing of notes
    $(document).on('click', '.edit-note', function() {
        const noteId = $(this).data('id');
        const currentNotes = $(this).data('notes');
        // Set the notes into the textarea for editing
        $('textarea[name="notes"]').val(currentNotes);

        // Store the note ID for editing in the form's data attribute
        $('#save-notes-form').attr('data-edit-id', noteId);
    });
});

// Function to toggle the notes section
function toggleNotesSection() {
    var notesSection = document.getElementById("notesSection");
    if (notesSection.style.display === "none") {
        notesSection.style.display = "block"; // Show the notes section
    } else {
        notesSection.style.display = "none"; // Hide the notes section
    }
}