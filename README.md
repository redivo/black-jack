black-jack
==========

Black Jack implementation in VHDL.

Instructions
-------

* Está tudo sincronizado com a borda de subida do clock. Não há generic para isso.

* Após o reset, esperar pelo menos 52 ciclos de clock para carregar o baralho de cartas.

* O programa shuffle.c pode ser opcionalmente usado para gerar um novo baralho embaralhado. Depois, tem que passar isso para o card_deck.vhd.

* Pode-se usar o testbench já criado, black_jack_top_tb.vhd, para ver como são instanciadas as entidades do projeto.

* Normalmente, uma operação na borda de subida do clock será processada no próximo ciclo.

### States

* Estado de reset para inicialização;
* Estado de load para carregar baralho;
* Estado para distribuição de cartas para cada jogador;
* Estado para exibição dos pontos;
* Estado para verificar se alguém ganhou (executado no início e após cada hit e stay);
* Estado para verificar se player apertou stay ou hit. Quando stay, fica no dealer até 16 pontos, se for o caso.
* Estado de fim de jogo, é eterno e fica verificando o botão show. Fica exibindo pontuação dos jogadores conforme botão show.

