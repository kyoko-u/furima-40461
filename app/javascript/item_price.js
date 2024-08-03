document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const taxDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  priceInput.addEventListener('input', () => {
    const price = parseInt(priceInput.value, 10);
    if (price >= 300 && price <= 9999999) {
      const tax = Math.floor(price * 0.1);
      const profit = price - tax;

      taxDisplay.innerHTML = `${tax.toLocaleString()}円`;
      profitDisplay.innerHTML = `${profit.toLocaleString()}円`;
    } else {
      taxDisplay.innerHTML = '';
      profitDisplay.innerHTML = '';
    }
  });
});


window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
