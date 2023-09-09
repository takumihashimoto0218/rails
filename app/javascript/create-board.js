// create-board.js
document.addEventListener('DOMContentLoaded', () => {
  const createBoardButton = $('#create-board-button').get(0);
  const packId = $('[data-pack-id]').data('pack-id');

  createBoardButton.addEventListener('click', () => {
    const form = $('<form>');
    form.prop('method', 'GET');
    form.prop('action', '/boards/new');

    $('<input>', {
      type: 'hidden',
      name: 'pack_id',
      value: packId
    }).appendTo(form);

    form.appendTo('body');
    form.submit();
  });
});