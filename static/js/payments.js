// Show payment method details
function showDetails(method) {
    document.getElementById('bank-transfer-details').classList.add('hidden');
    document.getElementById('point-of-sale-details').classList.add('hidden');
    document.querySelectorAll('.payment-option').forEach(option => option.classList.remove('active'));

    if (method === 'bank') {
        document.getElementById('bank-transfer-details').classList.remove('hidden');
        document.querySelector('.payment-option[data-method="bank"]').classList.add('active');
    } else if (method === 'pos') {
        document.getElementById('point-of-sale-details').classList.remove('hidden');
        document.querySelector('.payment-option[data-method="pos"]').classList.add('active');
    }
}

// Toggle POS code input fields
function togglePosCodeInput(selectedPos) {
    const posCodeInputs = ['pos-code-input-copy', 'pos-code-input-medec'];
    posCodeInputs.forEach(inputId => document.getElementById(inputId).classList.add('hidden'));

    if (selectedPos === 'Copy House') {
        document.getElementById('pos-code-input-copy').classList.remove('hidden');
    } else if (selectedPos === 'Medec\'In Casa - UM6SS') {
        document.getElementById('pos-code-input-medec').classList.remove('hidden');
    }
}

// Copy text to clipboard
function copyToClipboard(elementId) {
    const copyText = document.getElementById(elementId).textContent || document.getElementById(elementId).innerText;
    navigator.clipboard.writeText(copyText)
        .then(() => alert("Copied: " + copyText))
        .catch(err => console.error('Failed to copy: ', err));
}

// Cart management
let cart = [];
let selectedProgram = null;

function addToCart(title, price, id) {
    if (cart.length > 0) {
        document.getElementById('popup').style.display = 'block';
        return;
    }
    selectedProgram = { title, price, id };
    cart.push(selectedProgram);
    updateCartDisplay();
    toggleCart();
}

function updateCartDisplay() {
    const cartItemsDiv = document.getElementById('cartItems');
    const cartTotalDiv = document.getElementById('cartTotal');
    const totalAmountInput = document.getElementById('totalAmount');
    const checkoutForm = document.getElementById('checkoutForm');

    cartItemsDiv.innerHTML = '';
    let total = 0;

    cart.forEach(item => {
        total += item.price;
        cartItemsDiv.innerHTML += `<div class="cart-item">${item.title} - ${item.price} EUR <span class="remove-item" onclick="removeFromCart('${item.id}')">×</span></div>`;
    });

    cartTotalDiv.innerText = `Total: ${total} EUR`;
    totalAmountInput.value = total;
    checkoutForm.style.display = cart.length > 0 ? 'block' : 'none';
}

function removeFromCart(id) {
    cart = cart.filter(item => item.id !== id);
    updateCartDisplay();
}

function toggleCart() {
    const cartPanel = document.getElementById('cartPanel');
    cartPanel.style.right = cartPanel.style.right === '0px' ? '-300px' : '0';
}

function closePopup() {
    document.getElementById('popup').style.display = 'none';
}

// Show specific tab content
function showTab(tabId) {
    document.querySelectorAll('.tab-pane').forEach(pane => pane.style.display = 'none');
    document.getElementById(tabId).style.display = 'block';

    document.getElementById('checkoutButton').style.display = tabId === 'orderSummary' ? 'none' : 'block';
    document.getElementById('proceedButton').style.display = tabId === 'orderSummary' ? 'block' : 'none';
}

function toggleProceedButton() {
    const bankFileInput1 = document.getElementById('bank-receipt-upload');
    const bankFileInput2 = document.getElementById('bankcarteetudiant_receipt_upload');
    const posFileInput = document.getElementById('carteetudiant_receipt_upload');
    const proceedButton = document.getElementById('proceedButton');
    const bankTransferDetails = document.getElementById('bank-transfer-details');
    const pointOfSaleDetails = document.getElementById('point-of-sale-details');

    if (!bankTransferDetails.classList.contains('hidden') && bankFileInput1.files.length > 0 && bankFileInput2.files.length > 0) {
        proceedButton.style.display = 'block';
    } else if (!pointOfSaleDetails.classList.contains('hidden') && posFileInput.files.length > 0) {
        proceedButton.style.display = 'block';
    } else {
        proceedButton.style.display = 'none';
    }
}

document.addEventListener('DOMContentLoaded', toggleProceedButton);

function checkUploads() {
    const bankTransferInputs = [
        document.getElementById('bank-receipt-upload'),
        document.getElementById('bankcarteetudiant_receipt_upload')
    ];
    const posInputs = [
        document.getElementById('carteetudiant_receipt_upload')
    ];

    const currentPaymentMethod = document.querySelector('input[name="payment_method"]:checked');

    if (currentPaymentMethod) {
        if (currentPaymentMethod.value === 'bank' && bankTransferInputs.every(input => input.files.length > 0)) {
            hidePaymentDetails();
            hideCartPanel();
            showTab('transactionHistory');
        } else if (currentPaymentMethod.value === 'pos' && posInputs[0].files.length > 0) {
            hidePaymentDetails();
            hideCartPanel();
            showTab('transactionHistory');
        } else {
            alert('Please upload required documents.');
        }
    } else {
        alert('Please select a payment method.');
    }
}

function hidePaymentDetails() {
    document.getElementById('bank-transfer-details').classList.add('hidden');
    document.getElementById('point-of-sale-details').classList.add('hidden');
}

function hideCartPanel() {
    const cartPanel = document.getElementById('cartPanel');
    if (cartPanel) cartPanel.style.display = 'none';
}

// Handle payment completion
function completePayment() {
    const currentPaymentMethod = document.querySelector('input[name="payment_method"]:checked');
    const documentInput1 = document.getElementById('bank-receipt-upload');
    const documentInput2 = document.getElementById('bankcarteetudiant_receipt_upload');
    const posInput = document.getElementById('carteetudiant_receipt_upload');

    if (currentPaymentMethod && (
        (currentPaymentMethod.value === 'bank' && documentInput1.files.length && documentInput2.files.length) ||
        (currentPaymentMethod.value === 'pos' && posInput.files.length))) {
        cart = [];
        updateCartDisplay();
        alert('Proceeding to payment...');
    } else {
        alert('Please complete document upload and payment method selection.');
    }
}

