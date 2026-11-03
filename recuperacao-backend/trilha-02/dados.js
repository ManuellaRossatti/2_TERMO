const entrada = require("readline-sync");
const produto = entrada.question("Produto: ");
const quantidade = Number(entrada.question("Quantidade: "));
const preco = Number(entrada.question("Preco unitario: "));
const subtotal = quantidade * preco;
console.log(`Produto: ${produto}`);
console.log(`Subtotal: R$ ${subtotal.toFixed(2)}`);