document.addEventListener('DOMContentLoaded', () => {
  const createBoardButton = $('#create-board-button').get(0);

  createBoardButton.addEventListener('click', () => {
    const packId = $('[data-pack-id]').data('pack-id');
    const currentPage = $('[data-page]').data('page');

    const url = `/boards/new?pack_id=${packId}&page=${currentPage}`;

    window.location.href = url;
  });
});

