import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.input_address');
  console.log(addressInput);
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
