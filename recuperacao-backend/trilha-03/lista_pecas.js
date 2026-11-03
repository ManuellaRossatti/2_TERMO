// const pecas = ["P01", "P02", "P03"];
// console.log(pecas[10]); // undefined
// console.log(pecas.length); // 3
// pecas.push("P04");
// for (let i = 0; i < pecas.length; i++) {
//     console.log(pecas[i]);
// }

const temperaturas = [22, 24, 26, 23, 25];
let soma = 0;
let acima24 = 0;
for (let i = 0; i < temperaturas.length; i++) {
    soma += temperaturas[i];
    if (temperaturas[i] > 24) acima24++;
}
const media = soma / temperaturas.length;
console.log(`Media: ${media.toFixed(1)} C`);
console.log(`Acima de 24 C: ${acima24}`);