      ******************************************************************
      * Author: Breno Lucena
      *> Date: 14/07/2023
      *> Purpose: Exercicio Ficha 27 - UFCD0807
      *> Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa27.
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
           05  GRAVAR-NOME         PIC X(20).
           05  GRAVAR-NOTA1        PIC 99.99.
           05  FILLER              PIC X(3) VALUE "   ".
           05  GRAVAR-NOTA2        PIC 99.99.
           05  FILLER              PIC X(3) VALUE "   ".
           05  GRAVAR-NOTA3        PIC 99.99.
           05  FILLER              PIC X(3) VALUE "   ".
           05  GRAVAR-NOTA4        PIC 99.99.
           05  FILLER              PIC X(3) VALUE "   ".
       WORKING-STORAGE SECTION.
       01  FIM-DO-FICHEIRO         PIC X VALUE "N".
       01  NOTA-1                  PIC 99V99.
       01  NOTA-2                  PIC 99V99.
       01  NOTA-3                  PIC 99V99.
       01  NOTA-4                  PIC 99V99.
       01  A-MEDIA                 PIC 99V99.
       01  O-RESULTADO1            PIC X(10).
       01  O-RESULTADO2            PIC X(20).
       01  NOME-ALUNO              PIC X(20).

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
           PERFORM APLICATIVO-NOTAS UNTIL FIM-DO-FICHEIRO = "Y".
           PERFORM FECHAR-FICHEIRO.

       PROGRAM-END.
           DISPLAY "Fim do programa.".
           STOP RUN.

      *>   NIVEL 2
       APLICATIVO-NOTAS.
           PERFORM LER-FICHEIRO.
           PERFORM CALCULAR-NOTAS.
           PERFORM RESULTADO-ECRA.
           PERFORM PROXIMA-LEITURA.

      *>   NIVEL 3
       CALCULAR-NOTAS.
           PERFORM CALCULO-MEDIA.
           PERFORM VERIFICA-RESULTADO.
           PERFORM AVALIA-O-RESULTADO.

       RESULTADO-ECRA.
           PERFORM ATRUIBUIR-ESTRUTURA.
           PERFORM MOSTRAR-RESULTADO.

      *>   NIVEL 4
       LER-FICHEIRO.
           MOVE GRAVAR-NOME TO NOME-ALUNO
           MOVE GRAVAR-NOTA1 TO NOTA-1
           MOVE GRAVAR-NOTA2 TO NOTA-2
           MOVE GRAVAR-NOTA3 TO NOTA-3
           MOVE GRAVAR-NOTA4 TO NOTA-4.

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
           MOVE NOTA-1 TO DISPLAY-A-NOTA1
           MOVE NOTA-2 TO DISPLAY-A-NOTA2
           MOVE NOTA-3 TO DISPLAY-A-NOTA3
           MOVE NOTA-4 TO DISPLAY-A-NOTA4
           MOVE A-MEDIA TO DISPLAY-A-MEDIA
           MOVE O-RESULTADO1 TO DISPLAY-O-RESULTADO1
           MOVE O-RESULTADO2 TO DISPLAY-O-RESULTADO2.

       MOSTRAR-RESULTADO.
           IF NOME-ALUNO NOT = SPACE
               DISPLAY DISPLAY-ALUNO.

       ABERTURA-FICHEIRO.
           OPEN INPUT NOTAS-FILE.

       PROXIMA-LEITURA.
           READ NOTAS-FILE NEXT RECORD AT END MOVE "Y"
               TO FIM-DO-FICHEIRO.

       FECHAR-FICHEIRO.
           CLOSE NOTAS-FILE.

       END PROGRAM programa27.
