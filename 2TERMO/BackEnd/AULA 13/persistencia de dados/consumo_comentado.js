// Carrega o módulo nativo 'fs' (File System) do Node.js para permitir leitura e escrita no disco
const fs = require('fs');

// Imprime no terminal o cabeçalho inicial do programa
console.log("=== SISTEMA DE GESTÃO DE CHÃO DE FÁBRICA: CONSUMO DE DADOS ===");

// Define em uma constante o nome/caminho relativo do arquivo JSON que será consumido
const caminhoArquivo = 'maquinas.json';

// Inicia um bloco de tratamento de exceções; qualquer erro gerado aqui dentro será capturado pelo 'catch'
try {
    // 1. Verificação preventiva da existência do arquivo
    // 'fs.existsSync' retorna true se o arquivo existir ou false se não existir; o operador '!' inverte para testar se NÃO existe
    if (!fs.existsSync(caminhoArquivo)) {
        // Interrompe a execução do bloco 'try' e dispara manualmente um erro com uma mensagem descritiva
        throw new Error(`O arquivo '${caminhoArquivo}' não foi localizado no diretório atual.`);
    }

    // 2. Leitura do arquivo em disco (Texto bruto em UTF-8)
    // Lê o conteúdo do arquivo de forma síncrona (bloqueante) e interpreta os bytes no padrão de caracteres 'utf-8'
    const textoDoArquivo = fs.readFileSync(caminhoArquivo, 'utf-8');

    // 3. Desserialização: conversão do texto JSON em Array de Objetos utilizável
    // Converte a string pura (JSON) em uma estrutura de dados nativa do JavaScript (neste caso, um array de objetos)
    const listaMaquinas = JSON.parse(textoDoArquivo);

    // Exibe no console a quantidade de itens presentes no array carregado usando a propriedade .length
    console.log(`Sucesso: ${listaMaquinas.length} máquinas carregadas na memória.\n`);

    // 4. Processamento 1: Listagem completa com formatação tabular simples
    // Imprime um separador textual indicando o início da listagem completa
    console.log("--- Inventário Completo ---");

    // Laço de repetição tradicional: inicia o contador em 0 e itera até o último índice do array
    for (let i = 0; i < listaMaquinas.length; i++) {
        // Armazena o objeto da máquina da posição atual em uma constante para facilitar a leitura do código
        const maquina = listaMaquinas[i];

        // Usa operador ternário: se 'maquina.operacional' for true, define "OPERACIONAL"; se for false, define "PARADA"
        const statusTexto = maquina.operacional ? "OPERACIONAL" : "PARADA";

        // Imprime a linha formatada; '.padEnd()' preenche com espaços em branco à direita para alinhar as colunas visualmente
        console.log(`[ID ${maquina.id}] ${maquina.nome.padEnd(30, ' ')} | Setor: ${maquina.setor.padEnd(12, ' ')} | Status: ${statusTexto}`);
    }

    // 5. Processamento 2: Varredura seletiva (Filtragem de máquinas com defeito)
    // Imprime o cabeçalho do relatório de manutenção
    console.log("\n--- Relatório de Manutenção Urgente ---");

    // Inicializa uma variável acumuladora para contar quantas máquinas estão com status inoperante
    let maquinasParadas = 0;

    // Segundo laço de repetição para percorrer novamente o array em busca de máquinas paradas
    for (let i = 0; i < listaMaquinas.length; i++) {
        // Verifica se a propriedade 'operacional' é avaliada como false (operador de negação '!')
        if (!listaMaquinas[i].operacional) {
            // Imprime um alerta indicando a necessidade de abertura de OS com o nome e setor da máquina
            console.log(`-> Ordem de serviço necessária para: ${listaMaquinas[i].nome} (Setor: ${listaMaquinas[i].setor})`);

            // Incrementa o contador de máquinas inoperantes em 1
            maquinasParadas++;
        }
    }

    // Verifica se nenhuma máquina parada foi encontrada (contador permaneceu em 0)
    if (maquinasParadas === 0) {
        // Mensagem positiva informando que 100% dos equipamentos estão funcionando
        console.log("Todas as máquinas do parque fabril estão operacionais.");
    } else {
        // Caso haja máquinas paradas, imprime o total contabilizado
        console.log(`Total de máquinas inoperantes: ${maquinasParadas}`);
    }

// Bloco executado apenas se ocorrer um erro dentro do 'try' (arquivo inexistente, JSON corrompido, etc.)
} catch (erro) {
    // Exibe no console a mensagem amigável do erro capturado sem derrubar o processo abruptamente
    console.log(`Falha crítica na leitura dos dados: ${erro.message}`);
}