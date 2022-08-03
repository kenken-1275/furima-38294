function commission (){
 const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () =>{
    itemCommission = itemPrice.value * 0.1;
    itemCommissionValue = Math.floor(itemCommission);
    itemProfit = itemPrice.value - itemCommissionValue;
    const tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    tax.innerHTML = `${itemCommissionValue}`;
    profit.innerHTML = `${itemProfit}`;
  });
};

window.addEventListener('load',commission);