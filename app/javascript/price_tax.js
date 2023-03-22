window.addEventListener('load', () => {
  // 価格
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
    // 税
     const tax = 10

     //  販売手数料
     const addTaxDom = document.getElementById("add-tax-price");
     const price_tax = Math.floor(priceInput.value * tax / 100 );
     addTaxDom.innerHTML = price_tax;
     
    //  販売利益
     const addPofitDom = document.getElementById("profit");
     addPofitDom.innerHTML = priceInput.value - price_tax
 })
});