# Softwarrior

Um jogo 2D Platforming, no estilo dos jogos da franquia Mario.

## Equipe

- Adler Melgaço Ferreira
- Hiago de Souza Cruz Alves e Silva
- Marcelo Luiz Harry Diniz Lemos
- Pedro Andrade Militão
- Pedro Elias Valadares Castanheira

[Planilha de Apuração de Horas Trabalhadas](https://docs.google.com/spreadsheets/d/1d-M2r0Hqc7PQQRQg2BjsgkzJxiU2KVb_vhlAvm8cmdg/edit?usp=sharing)

## Features do jogo
- Quatro fases únicas
- Quatro inimigos diferentes
- Um boss (um inimigo desafiador ao final do jogo)
- Arte e Trilha sonora originais
- Sistema de Upgrades (melhorias para o protagonista ao final de cada fase)
- Sistema de Save
- Scoreboard Online (verificar e comparar sua performance com outros jogadores)

## Tecnologia

A engine [Godot](https://godotengine.org) e sua linguagem nativa, Gdscript, serão utilizadas para a implementação da maior parte dos recursos do jogo. O Scoreboard será feito através de um webservice com springboot em Java.

## Estórias

#### 1. Protagonista (*13 Story Points*)
- Movimentação básica (Andar e pular)
- Combate básico (Corpo a corpo e à distância)
- Dash
- Parry
- Wall Grab
- Design visual
- Arte e animações

#### 2. Sistema de Pontuação (*5 Story Points*)
- Criação do banco
- Serviço de cadastro/consulta online
- Sistema de desempenho
- Interface do scoreboard

#### 3. Salvar jogo (*2 Story Points*)
- Salvar progresso do jogador
- Carregar progresso salvo
- Interface no jogo e em menus

#### 4. Inimigos (*13 Story Points*)
- Comportamento do inimigo 1
- Arte do inimigo 1
- Comportamento do inimigo 2
- Arte do inimigo 2
- Comportamento do inimigo 3
- Arte do inimigo 3
- Comportamento do inimigo 4
- Arte do inimigo 4
- Comportamento do boss
- Arte do boss
- Cutscene do boss
- Sistema respawn (Quando o inimigo derrotado volta para a fase)

#### 5. Design de level (*8 Story Points*)
- Arte da fase 1
- Design da fase 1
- Musica da fase 1
- Arte da fase 2
- Design da fase 2
- Musica da fase 2
- Arte da fase 3
- Design da fase 3
- Musica da fase 3
- Arte da fase 4
- Design da fase 4
- Musica da fase 4


#### 6. Interface Geral (*3 Story Points*)
- Menu Principal
- Tela de Game Over
- Menu de Opções
- Menu de seleção de niveis
- HUD (barra de vida, pontuação, etc)
- Música
- Design visual
