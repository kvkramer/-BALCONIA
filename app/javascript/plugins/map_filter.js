// map_filter.js

const initFilter = () => {

  if (document.querySelector('.map-filters-toggle')) {
    const filterToggle = document.querySelector('.map-filters-toggle');
    const filterList = document.querySelector('.map-filters');
    const overlay = document.querySelector('.overlay');

    filterToggle.addEventListener('click', () => {
      filterList.classList.toggle('open')
      overlay.classList.toggle('open')
    });

    overlay.addEventListener('click', () => {
      filterList.classList.toggle('open')
      overlay.classList.toggle('open');
    });
  };

};

export {initFilter};
