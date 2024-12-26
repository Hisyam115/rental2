document.addEventListener('DOMContentLoaded', () => {
    const passwordFields = document.querySelectorAll('.password-toggle');
    passwordFields.forEach((field) => {
        const toggleButton = document.createElement('button');
        toggleButton.innerText = 'Show';
        toggleButton.classList.add('btn', 'btn-sm', 'btn-outline-secondary', 'mt-1');
        toggleButton.style.display = 'block';

        field.parentNode.appendChild(toggleButton);

        toggleButton.addEventListener('click', (e) => {
            e.preventDefault();
            if (field.type === 'password') {
                field.type = 'text';
                toggleButton.innerText = 'Hide';
            } else {
                field.type = 'password';
                toggleButton.innerText = 'Show';
            }
        });
    });
});

document.getElementById('menu-toggle').addEventListener('click', function () {
    const sidebar = document.getElementById('sidebar');
    sidebar.classList.toggle('d-none');
});