// Importa o módulo nativo de arquivos
const fs = require('fs');

console.log("=== SISTEMA DE GESTÃO DE CHÃO DE FÁBRICA: CONSUMO DE DADOS ===");

const caminhoArquivo = 'maquinas.json';

try {
    // 1. Verificação preventiva da existência do arquivo
    if (!fs.existsSync(caminhoArquivo)) {
        throw new Error(`O arquivo '${caminhoArquivo}' não foi localizado no diretório atual.`);
    }

    // 2. Leitura do arquivo em disco (Texto bruto em UTF-8)
    const textoDoArquivo = fs.readFileSync(caminhoArquivo, 'utf-8');

    // 3. Desserialização: conversão do texto JSON em Array de Objetos utilizável
    const listaMaquinas = JSON.parse(textoDoArquivo);

    console.log(`Sucesso: ${listaMaquinas.length} máquinas carregadas na memória.\n`);

    // 4. Processamento 1: Listagem completa com formatação tabular simples
    console.log("--- Inventário Completo ---");
    for (let i = 0; i < listaMaquinas.length; i++) {
        const maquina = listaMaquinas[i];
        const statusTexto = maquina.operacional ? "OPERACIONAL" : "PARADA";
        console.log(`[ID ${maquina.id}] ${maquina.nome.padEnd(30, ' ')} | Setor: ${maquina.setor.padEnd(12, ' ')} | Status: ${statusTexto}`);
    }

    // 5. Processamento 2: Varredura seletiva (Filtragem de máquinas com defeito)
    console.log("\n--- Relatório de Manutenção Urgente ---");
    let maquinasParadas = 0;

    for (let i = 0; i < listaMaquinas.length; i++) {
        if (!listaMaquinas[i].operacional) {
            console.log(`-> Ordem de serviço necessária para: ${listaMaquinas[i].nome} (Setor: ${listaMaquinas[i].setor})`);
            maquinasParadas++;
        }
    }

    if (maquinasParadas === 0) {
        console.log("Todas as máquinas do parque fabril estão operacionais.");
    } else {
        console.log(`Total de máquinas inoperantes: ${maquinasParadas}`);
    }

} catch (erro) {
    console.log(`Falha crítica na leitura dos dados: ${erro.message}`);
}