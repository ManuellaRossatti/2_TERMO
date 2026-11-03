const entrada = require('readline-sync');

const idade = entrada.questionInt('Qual e a sua idade? ');
const autorizacao = entrada.question('Voce tem autorizacao? (S/N) ');
const autorizacaoMaiuscula = autorizacao.toUpperCase();

if (idade >= 18 && autorizacaoMaiuscula === 'S') {
    console.log('Acesso PERMITIDO.');
} else {
    console.log('Acesso NEGADO.');
}
