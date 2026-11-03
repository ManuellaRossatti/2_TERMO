const entrada = require("readline-sync");
const cliente = entrada.question("Nome do cliente: ");
const quantidade = Number(entrada.question("Quantidade: "));
const precoUnitario = Number(entrada.question("Preco unitario: "));
if (isNaN(quantidade) || quantidade <= 0 || isNaN(precoUnitario) || precoUnitario < 0) {
    console.log("\n[Erro] Entrada inválida! A quantidade deve ser maior que zero e o preço não pode ser negativo.");
} else {
    const subtotal = quantidade * precoUnitario;
    const desconto = (subtotal >= 200) ? (subtotal * 0.10) : 0;
    const total = subtotal - desconto;
    console.log(`\n--- Resumo do Pedido (${cliente}) ---`);
    console.log(`Subtotal: R$ ${subtotal.toFixed(2)}`);
    console.log(`Desconto: R$ ${desconto.toFixed(2)}`);
    console.log(`Total:    R$ ${total.toFixed(2)}`);
}
