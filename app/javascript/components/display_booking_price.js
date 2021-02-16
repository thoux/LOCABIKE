const startDate = document.querySelector("#booking_start_date");
const endDate = document.querySelector("#booking_end_date");
const oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds

const priceDivHTML = (priceDiv, price, diffDays, rentalPrice, serviceFees) => {
  priceDiv.innerHTML = `
  <ul class='border border-primary rounded p-3 mb-3'>
    <li class="d-flex justify-content-between"><span>${price} € x ${diffDays} jours</span><span>${rentalPrice} €</span></li>
    <li class="d-flex justify-content-between"><span>Frais de service</span><span>${serviceFees} €</span></li>
    <hr>
    <li class="d-flex justify-content-between font-weight-bold"><span>Total</span><span>${rentalPrice + serviceFees} €</span></li>
  </ul>
  `;
}

const dateChange = (dateInput) => {
  dateInput.addEventListener('input', () => {
    console.log("hello");
    if (startDate.value.length > 0 && endDate.value.length > 0) {
      const priceDiv = document.querySelector("#booking-price");
      priceDiv.innerHTML = ``;
      const bikeAdPrice = document.querySelector("#booking-price").dataset.priceAd;
      const price = Number.parseInt(bikeAdPrice, 10);
      const startDateValue = new Date(startDate.value);
      const endDateValue = new Date(endDate.value);
      const diffDays = Math.round((endDateValue - startDateValue) / oneDay) + 1;
      const rentalPrice = diffDays * price;
      const serviceFees = Math.round(rentalPrice * 0.03);
      console.log(Math.abs((endDateValue - startDateValue) / oneDay));
      if (diffDays > 0) {
        priceDivHTML(priceDiv, price, diffDays, rentalPrice, serviceFees);
      }
    }
  });
}

const displayBookingPrice = () => {
  if (startDate) {
    dateChange(endDate);
    dateChange(startDate);
  }
}

export { displayBookingPrice };