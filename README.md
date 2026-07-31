## Guia prático para estudos em SQL 

O propósito deste repositório é disponibilizar exercícios de SQL resolvidos por mim, com explicações e linha de raciocínio desenvolvida. 

Os exercícios são de diferentes fontes (leetcode, cursos particulares, coderbyte, etc), os arquivos contendo as soluções trazem informações sobre a fonte e o índice dos exercícios. 

### Dicas para estudos:
- Antes de resolver um exercício de SQL, trace um mapa mental com os passos que você deve fazer para chegar à solução, então desenvolva a solução seguindo esses passos.
- Tente resolver o exercício antes de ver a minha solução, caso não  como começar ou trave em alguma parte, aí sim siga para a resolução.
- Nunca há apenas uma maneira de se construir um código, então não se prenda à minha solução, busque entender o racicínio e desenvolver a resposta com o que sabe.
- Clone o repositório para documentar suas resoluções dos exercícios.

## Setup para prática:
1. Escolha um banco de dados SQL gratuito e instale no seu computador, neste link há algumas opções: [As 5 melhores interfaces gráficas gratuitas e open source para MySQL em 2026](https://www.beekeeperstudio.io/pt-br/blog/free-mysql-guis)
2. Para cada exercício, crie as tabelas necessárias no seu banco de dados.
3. Teste executando sua query dentro do seu banco de dados.

>Observação:

Caso o exercício seja de alguma plataforma de exercícios online, terá o link para o exercício e você pode resolver dentro da plataforma, sem precisar de um banco de dados na sua máquina.

<br>

## Organização do repositório
As pastas contendo os exercícios são organizadas da seguinte forma:

```text
- 📁 leetcode 
  - 📁 easy
  - 📁 medium
  - 📁 hard
- 📁 coderbyte
  - 📁 easy
  - 📁 medium
  - 📁 hard
- 📁 curso particular Exemplo
  - 📁 easy
  - 📁 medum
  - 📁 hard
```

Dentro das subpastas separadas por dificuldade, cada arquivo `.sql` é um exercício.

>Exemplo:
```text
- 📁 leetcode 
  - 📁 easy
    - 📄 combine_two_tables.sql
    - 📄 employees_earning_more_than_their_managers.sql
```