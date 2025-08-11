document.addEventListener('turbolinks:load', () => {
  const container = document.getElementById('workout_details');
  const addBtn = document.getElementById('add_workout_detail');

  if (!container || !addBtn) return;

  addBtn.addEventListener('click', () => {
    const time = new Date().getTime();
    const regexp = new RegExp('new_workout_details', 'g');
    const newFormHtml = document.getElementById('workout_detail_template').innerHTML.replace(regexp, time);
    container.insertAdjacentHTML('beforeend', newFormHtml);
  });

  container.addEventListener('click', e => {
    if (e.target.classList.contains('remove_workout_detail')) {
      const wrapper = e.target.closest('.workout-detail-fields');
      if (wrapper) {
        const destroyField = wrapper.querySelector('input[type=hidden][name*="_destroy"]');
        if (destroyField) {
          destroyField.value = '1';
          wrapper.style.display = 'none';
        } else {
          wrapper.remove();
        }
      }
    }
  });
});