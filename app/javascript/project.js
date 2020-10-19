  const fee_rate = 0.1; 
  const maxPriceInput = 99999999;
  const minPriceInput = 300;
  const taxInteger = document.getElementById("product-price");
  
  taxInteger.addEventListener('keyup', (e) => {
	  const str = this.value;
	  const num = Number(str.replace(/[^0-9]/g, ''));
	  if(num == 0) {
		  num = '';
	  } else if (num > maxPriceInput) {
	  	num = maxPriceInput;
	  }
	  this.value = num;
  	if(num != 0) {
		  const price = num * fee_rate;
		  tagOutput.value = price;
    }
   
  });