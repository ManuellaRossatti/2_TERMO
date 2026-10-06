const readline = require('readline-sync');
const fs = require('fs');

const ferramentas = [];

const totalFerramentas = readline.questionInt('Quantas ferramentas deseja cadastrar? ');

console.log('\n--- Inicio do Cadastro ---');

for (let i = 0; i < totalFerramentas; i++) {
  console.log(`\nFerramenta ${i + 1} de ${totalFerramentas}:`);
  
  const nome = readline.question('Nome: ');
  const quantidade = readline.questionInt('Quantidade: ');
  const custoUnitario = readline.questionFloat('Custo unitario (R$): ');

  ferramentas.push({
    nome,
    quantidade,
    custoUnitario
  });
}

const quantidade_custo = JSON.stringify(ferramentas, null, 2);

try {
  fs.writeFileSync('ferramentas.json', quantidade_custo, 'utf-8');
  console.log(`\nSucesso: Lote finalizado com ${ferramentas.length} item(ns) e salvo em "ferramentas.json"!`);
} catch (erro) {
  console.error('\nErro ao salvar o arquivo:', erro.message);
}