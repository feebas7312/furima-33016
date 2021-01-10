function itemPrice(){

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    profit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  });

};
window.addEventListener('load', itemPrice);