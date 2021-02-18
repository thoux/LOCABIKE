import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.input_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
