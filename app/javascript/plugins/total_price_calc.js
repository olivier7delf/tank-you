const totalPriceCalc = () => {
  const dateElements = document.querySelectorAll('.date');
  if (dateElements) {
    dateElements.forEach((element) => {
      element.addEventListener('change', (event) => {
      const startYear = parseInt(document.querySelector('#order_start_date_1i').value);
      const startMonth = parseInt(document.querySelector('#order_start_date_2i').value);
      const startDay = parseInt(document.querySelector('#order_start_date_3i').value);
      const endYear = parseInt(document.querySelector('#order_end_date_1i').value);
      const endMonth = parseInt(document.querySelector('#order_end_date_2i').value);
      const endDay = parseInt(document.querySelector('#order_end_date_3i').value);

      const start_date = new Date(startYear, startMonth, startDay);
      const end_date = new Date(endYear, endMonth, endDay);

      const total_price_div = document.getElementById('total_price');
      const price = parseInt(total_price_div.dataset.price)

      const total_amount = ((end_date - start_date)/(1000 * 60 * 60 * 24)) * price;
      if (total_amount > 0) {
        document.querySelector('.prix_total').innerText = ` ${thousands_separators(total_amount)} €`;
      } else {
        document.querySelector('.prix_total').innerText = "T'es bourré ?"
      }

      });
    });

    function thousands_separators(num) {
      const num_parts = num.toString().split(".");
      num_parts[0] = num_parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      return num_parts.join(".");
    }
  }

}

export { totalPriceCalc };
