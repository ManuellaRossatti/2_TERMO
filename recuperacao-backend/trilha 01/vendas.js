const produto = "Parafuso"; 
const quantidade = 8; 
const precoUnitario = 3.75; 
const desconto = 5;
const total = quantidade * precoUnitario; 

console.log("Produto:", produto); 
console.log("Total: R$", total - desconto.toFixed(2));
