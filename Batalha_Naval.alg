algoritmo "Batalha Naval"
// Função : Jogo de Batalha Naval simples
// Autor : Adaptado do seu código
// Data : 16/06/2025
// Seção de Declarações
var
   matriz: vetor [1..10,1..10] de caractere
   linha, coluna: inteiro
   navio: inteiro
   submarino: inteiro
   tirosRestantes: inteiro
   naviosAfundados: inteiro
   submarinosAfundados: inteiro

inicio
// Seção de Comandos
escreval("=========================")
escreval("      BATALHA NAVAL      ")
escreval("=========================")
escreval()

// Inicializa a matriz com 'x' (água)
para linha de 1 ate 10 faca
   para coluna de 1 ate 10 faca
      matriz[linha,coluna] <- "x"
   fimpara
fimpara

// Coloca 5 navios 'n' aleatoriamente
para navio de 1 ate 5 faca
   linha <- randi(10)+1 // randi(N) retorna de 0 a N-1, então +1 para 1 a 10
   coluna <- randi(10)+1
   // Garante que não sobrescreva um navio ou submarino já existente
   enquanto (matriz[linha,coluna] = "n") ou (matriz[linha,coluna] = "s") faca
      linha <- randi(10)+1
      coluna <- randi(10)+1
   fimenquanto
   matriz[linha,coluna] <- "n"
fimpara

// Coloca 5 submarinos 's' aleatoriamente
para submarino de 1 ate 5 faca
   linha <- randi(10)+1
   coluna <- randi(10)+1
   // Garante que não sobrescreva um navio ou submarino já existente
   enquanto (matriz[linha,coluna] = "n") ou (matriz[linha,coluna] = "s") faca
      linha <- randi(10)+1
      coluna <- randi(10)+1
   fimenquanto
   matriz[linha,coluna] <- "s"
fimpara

// Define o número de tiros e contadores de navios afundados
tirosRestantes <- 25 // Exemplo: 25 tiros para um jogo simples
naviosAfundados <- 0
submarinosAfundados <- 0

// --- Loop Principal do Jogo ---
enquanto (tirosRestantes > 0) e ((naviosAfundados + submarinosAfundados) < 10) faca
   escreval()
   escreval("--- Mapa de Batalha ---")
   // Exibe o mapa para o jogador (mostra 'x', 'H' e 'M', mas não 'n' ou 's')
   para linha de 1 ate 10 faca
      para coluna de 1 ate 10 faca
         se (matriz[linha,coluna] = "n") ou (matriz[linha,coluna] = "s") entao
            escreva("x ": 2) // Esconde os navios e submarinos
         senao
            escreva(matriz[linha,coluna]: 2)
         fimse
      fimpara
      escreval()
   fimpara
   escreval("-----------------------")
   escreval("Tiros restantes: ", tirosRestantes)
   escreval("Navios afundados: ", naviosAfundados)
   escreval("Submarinos afundados: ", submarinosAfundados)
   escreval()

   // Pede e valida a linha
   repita
      escreval("Digite uma linha (1 a 10): ")
      leia(linha)
      se (linha < 1) ou (linha > 10) entao
         escreval("Linha inválida! Deve ser entre 1 e 10.")
      fimse
   ate (linha >= 1) e (linha <= 10)

   // Pede e valida a coluna
   repita
      escreval("Digite uma coluna (1 a 10): ")
      leia(coluna)
      se (coluna < 1) ou (coluna > 10) entao
         escreval("Coluna inválida! Deve ser entre 1 e 10.")
      fimse
   ate (coluna >= 1) e (coluna <= 10)

   escreval("Atirando em Linha ", linha, ", Coluna ", coluna, "...")

   // Verifica o resultado do tiro
   se matriz[linha,coluna] = "n" entao
      escreval("BOOM! Você acertou um NAVIO!")
      matriz[linha,coluna] <- "H" // Marca como acerto
      naviosAfundados <- naviosAfundados + 1
   senao se matriz[linha,coluna] = "s" entao
      escreval("SPLASH! Você acertou um SUBMARINO!")
      matriz[linha,coluna] <- "H" // Marca como acerto
      submarinosAfundados <- submarinosAfundados + 1
   senao se (matriz[linha,coluna] = "H") ou (matriz[linha,coluna] = "M") entao
      escreval("Você já atirou aqui! Escolha outro local.")
      // Não decrementa tiros restantes nem incrementa acertos se já atirou
   senao // É 'x' (água)
      escreval("ÁGUA! Você errou.")
      matriz[linha,coluna] <- "M" // Marca como erro
   fimse // Este 'fimse' fecha o bloco 'se...senao se...senao se...senao' do resultado do tiro.

   tirosRestantes <- tirosRestantes - 1
   escreval()
   escreval("Pressione ENTER para continuar...")
   leia(coluna) // Pausa para o jogador ver o resultado (usa coluna para ler qualquer coisa)
fimenquanto // Este 'fimenquanto' fecha o loop principal do jogo.

// --- Fim do Jogo ---
escreval("=========================")
se (naviosAfundados + submarinosAfundados) = 10 entao
   escreval("      PARABÉNS! VOCÊ AFUNDOU TODOS OS INIMIGOS!     ")
senao
   escreval("        FIM DE JOGO! VOCÊ FICOU SEM TIROS.         ")
**fimse** // Este 'fimse' fecha o bloco 'se...senao' que determina a mensagem final do jogo.
**escreval("=========================")** // <--- LINHA DO ERRO REPORTADO (aprox. linha 113)
escreval("Total de navios afundados: ", naviosAfundados)
escreval("Total de submarinos afundados: ", submarinosAfundados)
escreval("Obrigado por jogar!")
escreval()

// Opcional: Mostra o tabuleiro final com todas as posições
escreval("--- Mapa Final ---")
para linha de 1 ate 10 faca
   para coluna de 1 ate 10 faca
      escreva(matriz[linha,coluna]: 2)
   fimpara
   escreval()
fimpara
escreval("------------------")

fimalgoritmo
