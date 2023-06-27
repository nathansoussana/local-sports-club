document.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById('search-form');
  form.addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent default form submission

    const city = document.getElementById('city-field').value;
    const sport = document.getElementById('sport-field').value;
    const level = document.getElementById('level-field').value;

    fetch(`/search?city=${city}&sport=${sport}&level=${level}`, {
      headers: { 'X-Requested-With': 'XMLHttpRequest' }
    })
    .then(response => response.text())
    .then(data => {
      const resultsContainer = document.getElementById('event-cards');
      resultsContainer.innerHTML = data;
    })
    .catch(error => console.error(error));
  });
});
