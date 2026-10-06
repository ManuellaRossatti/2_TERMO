// EXERCÍCIO 04 — Classificação de temperatura

const entrada = require("readline-sync");

const temperatura = entrada.questionFloat("Digite a temperatura da máquina (°C): ");

let classificacao;

if (temperatura <= 60) {
    classificacao = "NORMAL";
} else if (temperatura <= 80) {
    classificacao = "ATENÇÃO";
} else {
    classificacao = "CRÍTICA";
}

console.log("\n=== SITUAÇÃO DA MÁQUINA ===");
console.log(`Temperatura: ${temperatura} °C`);
console.log(`Classificação: ${classificacao}`);