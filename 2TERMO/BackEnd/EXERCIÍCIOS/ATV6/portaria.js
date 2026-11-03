const entrada = require('readline-sync');
let listaVisitantes = [];

while (true) {
    let opcao = entrada.question("Deseja cadastrar um visitante? (s/n): ");

    if (opcao.toLowerCase() !== 's') {
        break; // Sai do loop se não for 's'
    }

    let nomeVis = entrada.question("Nome do visitante: ");
    let empresaVis = entrada.question("Empresa: ");

    // Criando o objeto e dando o push na mesma hora
    listaVisitantes.push({
        nome: nomeVis,
        empresa: empresaVis
    });

    console.log("✅ Registrado com sucesso!\n");
}

console.log("\n=== VISITANTES DO DIA ===");
// Listando um por um
for (let i = 0; i < listaVisitantes.length; i++) {
    console.log(`${i + 1}. ${listaVisitantes[i].nome} (${listaVisitantes[i].empresa})`);
}