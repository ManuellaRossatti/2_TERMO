# PBE12026

<div align="center">
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JavaScript" />
  <img src="https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white" alt="Node.js" />
  <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" alt="Git" />
</div>

Repositório com exercícios práticos de JavaScript, desenvolvidos durante o curso de Programação Básica em JavaScript.

## 📌 Descrição

Este projeto reúne atividades de lógica de programação, variáveis, estruturas condicionais, arrays, laços de repetição e pequenos desafios com Node.js. A proposta é praticar conceitos fundamentais da linguagem JavaScript e consolidar o aprendizado por meio de exercícios e desafios de programação.

## 🛠️ Tecnologias utilizadas

- JavaScript
- Node.js
- Biblioteca `readline-sync` para leitura de dados no terminal
- Git e GitHub para versionamento

## 📁 Estrutura do projeto
```text
PBE12026/
├── package.json
├── README.md
├── node_modules/
├── aulas/
│   ├── aula-01/
│   ├── aula-02/
│   ├── aula-03/
│   ├── aula-04/
│   ├── aula-05/
│   ├── aula-06/
│   ├── aula-09/
│   ├── aula-12/
│   └── exercicios-fixacao/
│       ├── atividade-1/
│       ├── atividade-2/
│       ├── atividade-3/
│       ├── atividade-4/
│       ├── atividade-5/
│       ├── atividade-6/
│       ├── geometria.js
│       └── main.js
```

## 📚 Resumo das aulas

### Aula 01

- Primeiros passos com JavaScript
- Uso de `console.log()`
- Declaração de variáveis
- Exercícios de cálculo de IMC
- Simulação de venda na padaria
- Manipulação básica de dados

### Aula 02

- Trabalhando com strings
- Template strings
- Melhorando a apresentação de textos e valores
- Revisão de operações com variáveis

### Aula 03

- Entrada de dados com `readline-sync`
- Cálculo de média
- Estruturas condicionais
- Situação do aluno: aprovado, recuperação ou reprovado
- Lógica de decisão simples

### Aula 04

- Estruturas de repetição
- Contadores
- Desafios de lógica
- Cálculo de etanol x gasolina
- Sistema de controle de acesso ao laboratório
- Exercícios de decisão e regra de negócio

### Aula 05

- Arrays
- Acesso por índice
- Manipulação de listas e dados em sequência
- Exemplos de uso de `.length`
- Exercícios com nomes de alunos

### Aula 06, Aula 09 e Aula 12

- Aula 06: funções e exercícios práticos (pastas e exemplos em `aulas/aula-06`).
- Aula 09: consultas e manipulação de arquivos (`aula-09`).
- Aula 12: projetos mais estruturados (p.ex. `oficina` e `logistica` em `aulas/aula-12`).

## 🧩 Exercícios de Fixação

As pastas em `aulas/exercicios-fixacao` reúnem atividades extras para consolidar conceitos. Atualmente incluem:


- `atividade-1` — exemplos e exercícios iniciais (veja `aulas/exercicios-fixacao/atividade-1`).
  - Arquivos principais: `app.js`, `conversor.js`
  - Executar:
    - `node aulas/exercicios-fixacao/atividade-1/app.js`
    - `node aulas/exercicios-fixacao/atividade-1/conversor.js`

- `atividade-2` — exercícios sobre geometria e lógica (veja `aulas/exercicios-fixacao/atividade-2`).
  - Arquivos principais: `geometria.js`, `main.js`
  - Executar:
    - `node aulas/exercicios-fixacao/atividade-2/geometria.js`
    - `node aulas/exercicios-fixacao/atividade-2/main.js`

- `atividade-3` — integrações com módulos e sensores (veja `aulas/exercicios-fixacao/atividade-3`).
  - Arquivos principais: `principal.js`, `sensor.js`
  - Executar:
    - `node aulas/exercicios-fixacao/atividade-3/principal.js`

- `atividade-4` — aplicações práticas (caixa, calculadora de vendas) (veja `aulas/exercicios-fixacao/atividade-4`).
  - Arquivos principais: `caixa.js`, `calculosVendas.js`
  - Executar:
    - `node aulas/exercicios-fixacao/atividade-4/caixa.js`

- `atividade-5` — qualidade e validações (veja `aulas/exercicios-fixacao/atividade-5`).
  - Arquivos principais: `qualidade.js`
  - Executar:
    - `node aulas/exercicios-fixacao/atividade-5/qualidade.js`

- `atividade-6` — exemplo de portaria e controle (veja `aulas/exercicios-fixacao/atividade-6`).
  - Arquivos principais: `portaria.js`
  - Executar:
    - `node aulas/exercicios-fixacao/atividade-6/portaria.js`

- `geometria.js` e `main.js` — utilitários e exemplos de uso (na raiz de `aulas/exercicios-fixacao`).

Observação: se algum exercício usar `readline-sync`, instale dependências com `npm install` na raiz do projeto antes de executar.

## ▶️ Como executar os arquivos

Certifique-se de ter o Node.js instalado em sua máquina.

### 1. Verificar a instalação

```bash
node -v
```

### 2. Entrar na pasta da aula

```bash
cd aulas/aula-04
```

### 3. Executar um arquivo JavaScript

```bash
node desafio_etanol.js
```

Também é possível rodar outros arquivos da mesma forma:

```bash
node contador.js
node tabuada.js
node ../aula-05/array2.js
```

## 🌿 Git

### Inicializar o repositório

```bash
git init
```

### Adicionar arquivos

```bash
git add .
```

### Registrar a versão

```bash
git commit -m "Primeiro commit"
```

### Criar a branch principal

```bash
git branch -M main
```

### Conectar ao GitHub

```bash
git remote add origin <URL_DO_REPOSITORIO>
```

### Enviar para o GitHub

```bash
git push -u origin main
```

## 👨‍🏫 Autor

Prof. Celso Ricardo Carvalho

## 📝 Observação

Este repositório está em evolução conforme os exercícios e desafios do curso forem sendo desenvolvidos.

Observação: Alguns arquivos usam `readline-sync` para entrada no terminal; garantir que as dependências estejam instaladas com `npm install` antes de executar.

**Instruções básicas de Git**

1. Inicializar repositório (se ainda não estiver inicializado):

```bash
git init
git add .
git commit -m "Adicionar exercícios PBE12026"
```

2. Conectar a um repositório remoto e enviar as alterações:

```bash
git remote add origin <URL_DO_REPOSITORIO>
git branch -M main
git push -u origin main
```

3. Fluxo comum de trabalho:

```bash
git status
git add <arquivos>
git commit -m "Mensagem descritiva"
git push
```
>>>>>>> 5f1103d819df874da81779a5c97ee7b636f29346