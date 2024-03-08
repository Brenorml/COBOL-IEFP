      ******************************************************************
      * Author: Breno Lucena
      *> Date: 14/07/2023
      *> Purpose: Exercicio Ficha 26 - UFCD0807
      *> Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa26.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL NOTAS-FILE
               ASSIGN TO "notas.dat"
               ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD  NOTAS-FILE.

       01  GRAVAR-DADOS-ALUNO.
           05  GRAVAR-NOME     PIC X(20).
           05  GRAVAR-NOTA1    PIC 99.99.
           05  FILLER          PIC X(3) VALUE "   ".
           05  GRAVAR-NOTA2    PIC 99.99.
           05  FILLER          PIC X(3) VALUE "   ".
           05  GRAVAR-NOTA3      PIC 99.99.
           05  FILLER          PIC X(3) VALUE "   ".
           05  GRAVAR-NOTA4    PIC 99.99.
           05  FILLER          PIC X(3) VALUE "   ".
       WORKING-STORAGE SECTION.
       01  OPCAO       PIC X.
       01  NOTA-1      PIC 99V99.
       01  NOTA-2      PIC 99V99.
       01  NOTA-3      PIC 99V99.
       01  NOTA-4      PIC 99V99.
       01  A-MEDIA     PIC 99V99.
       01  O-RESULTADO1 PIC X(10).
       01  O-RESULTADO2 PIC X(20).
       01  NOME-ALUNO  PIC X(20).
      *    MUDAR ALUNO PARA DISPLAY-ALUNO
       01  DISPLAY-ALUNO.
           05  DISPLAY-NOME-ALUNO  PIC  X(20).
           05  MSG-PARTE-1         PIC X(9) VALUE " Nota 1: ".
           05  DISPLAY-A-NOTA1     PIC 99.99.
           05  MSG-PARTE-2         PIC X(14) VALUE "     Nota 2: ".
           05  DISPLAY-A-NOTA2     PIC 99.99.
           05  MSG-PARTE-3         PIC X(14) VALUE "     Nota 3: ".
           05  DISPLAY-A-NOTA3     PIC 99.99.
           05  MSG-PARTE-4         PIC X(14) VALUE "     Nota 4: ".
           05  DISPLAY-A-NOTA4     PIC 99.99.
           05  MSG-PARTE-5         PIC X(13) VALUE "     Media: ".
           05  DISPLAY-A-MEDIA     PIC 99.99.
           05  MSG-PARTE-6         PIC X(4) VALUE "  | ".
           05  DISPLAY-O-RESULTADO1 PIC X(10).
           05  MSG-PARTE-7         PIC X(2) VALUE "| ".
           05  DISPLAY-O-RESULTADO2 PIC X(20).
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
      *>   NIVEL 1
           PERFORM ABERTURA-FICHEIRO.
           PERFORM APLICATIVO-NOTAS.

       PROGRAM-END.
           DISPLAY "Fim do programa.".
           STOP RUN.

      *>   NIVEL 2
       APLICATIVO-NOTAS.
           PERFORM ENTRADA-ECRA.
           PERFORM CALCULAR-NOTAS.
           PERFORM RESULTADO-ECRA.
           PERFORM CONTINUA-OU-N.

      *>   NIVEL 3
       ENTRADA-ECRA.
           PERFORM DADOS-ESTUDANTE.
           PERFORM DADOS-NOTAS.

       CALCULAR-NOTAS.
           PERFORM CALCULO-MEDIA.
           PERFORM VERIFICA-RESULTADO.
           PERFORM AVALIA-O-RESULTADO.

       RESULTADO-ECRA.
           PERFORM ATRUIBUIR-ESTRUTURA.
           PERFORM GRAVAR-FICHEIRO.
           PERFORM MOSTRAR-RESULTADO.

       CONTINUA-OU-N.
           PERFORM S-OU-N.

      *>   NIVEL 4
       DADOS-ESTUDANTE.
           DISPLAY "Indique o nome do aluno: "
           ACCEPT NOME-ALUNO.
       DADOS-NOTAS.
           PERFORM DADOS-NOTA1.
           PERFORM DADOS-NOTA2.
           PERFORM DADOS-NOTA3.
           PERFORM DADOS-NOTA4.


       CALCULO-MEDIA.
           COMPUTE A-MEDIA =
           (NOTA-1 + NOTA-2 + NOTA-3 + NOTA-4)/4.
       VERIFICA-RESULTADO.
           IF A-MEDIA >= 10
               MOVE "Aprovado" TO O-RESULTADO1
           ELSE
               MOVE "Reprovado" TO O-RESULTADO1.
       AVALIA-O-RESULTADO.
           IF A-MEDIA < 5
               MOVE "MUITO INSUFICIENTE" TO O-RESULTADO2
           ELSE IF A-MEDIA < 10
               MOVE "INSUFICIENTE" TO O-RESULTADO2
           ELSE IF A-MEDIA < 15
               MOVE "SUFICIENTE" TO O-RESULTADO2
           ELSE IF A-MEDIA < 18
               MOVE "BOM" TO O-RESULTADO2
           ELSE
               MOVE "MUITO BOM" TO O-RESULTADO2.

       ATRUIBUIR-ESTRUTURA.
           MOVE NOME-ALUNO TO DISPLAY-NOME-ALUNO.
           MOVE NOME-ALUNO TO GRAVAR-NOME
           MOVE NOTA-1 TO DISPLAY-A-NOTA1
           MOVE NOTA-1 TO GRAVAR-NOTA1
           MOVE NOTA-2 TO DISPLAY-A-NOTA2
           MOVE NOTA-2 TO GRAVAR-NOTA2
           MOVE NOTA-3 TO DISPLAY-A-NOTA3
           MOVE NOTA-3 TO GRAVAR-NOTA3
           MOVE NOTA-4 TO DISPLAY-A-NOTA4
           MOVE NOTA-4 TO GRAVAR-NOTA4
           MOVE A-MEDIA TO DISPLAY-A-MEDIA
           MOVE O-RESULTADO1 TO DISPLAY-O-RESULTADO1
           MOVE O-RESULTADO2 TO DISPLAY-O-RESULTADO2.

       MOSTRAR-RESULTADO.
           DISPLAY DISPLAY-ALUNO.

       S-OU-N.
           DISPLAY "Desseja inserir novo aluno? (s/n)".
           ACCEPT OPCAO.
           IF OPCAO = "s" OR OPCAO = "S"
      *            PERFORM LIMPA-ECRA 25 TIMES
               PERFORM APLICATIVO-NOTAS
           ELSE
               PERFORM FECHAR-FICHEIRO.
               PERFORM PROGRAM-END.

       ABERTURA-FICHEIRO.
           OPEN EXTEND NOTAS-FILE.

       GRAVAR-FICHEIRO.
           WRITE GRAVAR-DADOS-ALUNO.

       FECHAR-FICHEIRO.
           CLOSE NOTAS-FILE.
      *>   NIVEL 5
       DADOS-NOTA1.
           DISPLAY "Indique a primeira nota: "
           ACCEPT NOTA-1
           IF NOTA-1 < 0 OR NOTA-1 > 20 THEN
               DISPLAY "Valor invalido"
               PERFORM DADOS-NOTA1.

       DADOS-NOTA2.
           DISPLAY "Indique a segunda nota: "
           ACCEPT NOTA-2
           IF NOTA-2 < 0 OR NOTA-2 > 20 THEN
               DISPLAY "Valor invalido"
               PERFORM DADOS-NOTA2.
       DADOS-NOTA3.
           DISPLAY "Indique a terceira nota: "
           ACCEPT NOTA-3
           IF NOTA-3 < 0 OR NOTA-3 > 20 THEN
               DISPLAY "Valor invalido"
               PERFORM DADOS-NOTA3.
       DADOS-NOTA4.
           DISPLAY "Indique a quarta nota: "
           ACCEPT NOTA-4
           IF NOTA-4 < 0 OR NOTA-4 > 20 THEN
               DISPLAY "Valor invalido"
               PERFORM DADOS-NOTA4.

       LIMPA-ECRA.
           DISPLAY " ".


       END PROGRAM programa26.
