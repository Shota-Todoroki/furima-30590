function product (){
  const fee_rate = 0.1; 
  const maxPriceInput = 9999999;
  const minPriceInput = 300;
  const taxInteger = document.getElementById("product-price");
  taxInteger.addEventListener("keyup",(e) => {
    const taxVal = taxInteger.value;
    const taxValue = Math.floor(taxVal * fee_rate);
    const taxNum = document.getElementById("add-tax-price");
    taxNum.innerHTML = `${taxValue.toLocaleString()}`;
    const profit = Math.floor(taxVal - taxValue);
    const profitNum = document.getElementById("profit");
    profitNum.innerHTML = `${profit.toLocaleString()}` ;
  });
}
setInterval(product, 1000);
