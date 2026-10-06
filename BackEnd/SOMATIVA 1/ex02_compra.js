// EXERCÍCIO 02 — Pedido de matéria-prima

const entrada = require("readline-sync");

const material = entrada.question("Nome do material: ");
const quantidade = entrada.questionInt("Quantidade comprada: ");
const precoUnitario = entrada.questionFloat("Preço unitário: R$ ");

const total = quantidade * precoUnitario;

console.log("\n=== RESUMO DA COMPRA ===");
console.log(`Material: ${material}`);
console.log(`Quantidade: ${quantidade}`);
console.log(`Preço unitário: R$ ${precoUnitario.toFixed(2)}`);
console.log(`Valor total: R$ ${total.toFixed(2)}`);