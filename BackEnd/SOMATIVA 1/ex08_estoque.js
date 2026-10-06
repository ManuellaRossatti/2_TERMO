// EXERCÍCIO 08 — Estoque de componentes

const entrada = require("readline-sync");

const componentes = [];

for (let i = 0; i < 3; i++) {
    console.log(`\nCadastro do componente ${i + 1}`);

    const nome = entrada.question("Nome: ");
    const quantidade = entrada.questionInt("Quantidade em estoque: ");
    const estoqueMinimo = entrada.questionInt("Estoque mínimo: ");

    const componente = {
        nome,
        quantidade,
        estoqueMinimo
    };

    componentes.push(componente);
}

console.log("\n=== RELATÓRIO DE ESTOQUE ===");

for (let i = 0; i < componentes.length; i++) {
    const item = componentes[i];

    console.log(`\nComponente: ${item.nome}`);
    console.log(`Quantidade: ${item.quantidade}`);
    console.log(`Estoque mínimo: ${item.estoqueMinimo}`);

    if (item.quantidade < item.estoqueMinimo) {
        console.log("Situação: REPOR ESTOQUE");
    } else {
        console.log("Situação: ESTOQUE OK");
    }
}