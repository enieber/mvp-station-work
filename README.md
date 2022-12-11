# <_Nome do projeto_>

## Requisitos
- nvm
- yarn

## Setup
1. Instalar o Node usando o `nvm`:
```sh
nvm install
```
2. Instalar as dependências usando `yarn`:
```sh
yarn
```
3. Criar uma cópia do arquivo `env.example`:
```sh
cp .env.example .env.local
```
> Os valores das variáveis de ambiente definidos no arquivo de exemplo são os de desenvolvimento.

## Up and running
1. Executar o compiler do ReScript:
```
yarn rescript build -w
```
2. Em outra sessão, executar o dev server do Next.js:
```sh
yarn next
```
