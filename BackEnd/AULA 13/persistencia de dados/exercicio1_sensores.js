const fs = require('fs');

const sensores = [
  {
    codigo: 1001,
    tipo: "Temperatura",
    leituraAtual: 45.5,
    status: "Operando"
  },
  {
    codigo: 1002,
    tipo: "Pressão",
    leituraAtual: 4,
    status: "Alerta"
  },
  {
    codigo: 1003,
    tipo: "Temperatura",
    leituraAtual: 92.1,
    status: "Operando"
  }
];

const  valoresGravados = JSON.stringify(sensores, null, 2);

try {
  fs.writeFileSync('sensores.json', valoresGravados);
  console.log('Sucesso: Arquivo "sensores.json" criado e salvo com êxito!');
} catch (erro) {
  console.error('Erro ao salvar o arquivo:', erro.message);
}