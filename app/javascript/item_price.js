const price = () => {
  const priceInput = document.getElementById('item-price');
  const taxDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value, 10);
      if (price >= 300 && price <= 9999999) {
        const tax = Math.floor(price * 0.1);
        const profit = price - tax;

        taxDisplay.innerHTML = `${tax.toLocaleString()}`;
        profitDisplay.innerHTML = `${profit.toLocaleString()}`;
      } else {
        taxDisplay.innerHTML = '';
        profitDisplay.innerHTML = '';
      }
    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
