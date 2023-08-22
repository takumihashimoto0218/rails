// create-board.js

document.addEventListener('DOMContentLoaded', () => {
  const createBoardButton = document.getElementById('create-board-button');
  const packId = createBoardButton.dataset.packId;


  createBoardButton.addEventListener('click', () => {
    const form = document.createElement('form');
    form.method = 'GET';
    form.action = '/boards/new';

    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'pack_id';
    input.value = packId;

    form.appendChild(input);

    document.body.appendChild(form);
    form.submit();
  });
});


