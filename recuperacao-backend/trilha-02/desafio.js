const entrada = require("readline-sync");
const codigo = entrada.question("Codigo da peca: ");
const medida = Number(entrada.question("Medida da peca (em mm): "));
if (Number.isNaN(medida) || medida <= 0) {
    console.log("Aviso: Dado invalido.");
} else if (medida >= 19.80 && medida <= 20.20) {
    console.log("\n--- Resultado ---");
    console.log(`Codigo da peca: ${codigo}`);
    console.log(`Medida registrada: ${medida.toFixed(2)} mm`);
    console.log("Situacao final: APROVADA");
} else {
    console.log("\n--- Resultado ---");
    console.log(`Codigo da peca: ${codigo}`);
    console.log(`Medida registrada: ${medida.toFixed(2)} mm`);
    console.log("Situacao final: REPROVADA");
}
