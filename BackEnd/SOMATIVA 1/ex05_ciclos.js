// EXERCÍCIO 05 — Tabela de produção

const entrada = require("readline-sync");

const pecasPorCiclo = entrada.questionInt("Quantas peças a máquina produz por ciclo? ");

console.log("\n=== PRODUÇÃO ACUMULADA ===");

for (let ciclo = 1; ciclo <= 10; ciclo++) {
    const acumulado = pecasPorCiclo * ciclo;
    console.log(`Ciclo ${ciclo}: ${acumulado} peças`);
}