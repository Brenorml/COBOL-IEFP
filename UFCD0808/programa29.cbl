      ******************************************************************
      *> Author: Breno Lucena
      *> Date: 14/07/2023
      *> Purpose: Exercicio Ficha 29 - UFCD0807
      *> Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa29.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL NOTAS
               ASSIGN TO "notas1.dat"
               ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  NOTAS.
       01  REG-ALUNOS.
           05  NOMEALUNO          PIC X(20).
           05  MATERIA1           PIC X(20).
           05  NOTA1              PIC 99V99.
           05  MATERIA2           PIC X(20).
           05  NOTA2              PIC 99V99.
           05  MATERIA3           PIC X(20).
           05  NOTA3              PIC 99V99.
           05  MEDIAALUNO         PIC 99V99.
       WORKING-STORAGE SECTION.

       01  INSIRA-NOME            PIC X(5)    VALUE "Nome:".
       01  INSIRA-DISCIPLINA1     PIC X(13)   VALUE "Disciplina 1:".
       01  INSIRA-NOTA1           PIC X(12)   VALUE "Nota Ingles:".
       01  INSIRA-DISCIPLINA2     PIC X(13)   VALUE "Disciplina 2:".
       01  INSIRA-NOTA2           PIC X(17)   VALUE "Nota Programacao:".
       01  INSIRA-DISCIPLINA3     PIC X(13)   VALUE "Disciplina 3:".
       01  INSIRA-NOTA3           PIC X(16)   VALUE "Nota Matematica:".
       01  CALCULA-MEDIAALUNO     PIC X(15)   VALUE "Media Aluno:".
       01  AVALIACAO              PIC X(18).
       01  AVALIACAO88            PIC X(18).
       01  AVALIAR88COND          PIC 99V99(20).
           88  MTINSUF VALUES ARE  00.00   THRU    04.99.
           88  INSUF   VALUES ARE  05.00   THRU    09.99.
           88  SUF     VALUES ARE  10.00   THRU    14.99.
           88  BOM     VALUES ARE  15.00   THRU    17.99.
           88  MTBOM   VALUES ARE  18.00   THRU    20.00.

       01  SIM-NAO                PIC X.
       01  ENTRY-OK               PIC X.
       01  PAUSA                  PIC X.
       77  MENU                   PIC 9.
       77  OPCAO                  PIC 9.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
       PROGRAM-BEGIN.

       INICIO.
           DISPLAY "// 1 - INSERIR ALUNO           //".
           DISPLAY "// 2 - MOSTRAR LISTA COMPLETA  //".
           DISPLAY "// 3 - ALUNOS APROVADOS        //".
           DISPLAY "// 4 - ALUNOS REPROVADOS       //".
           DISPLAY "// 5 - SAIR                    //".
           ACCEPT OPCAO.

           IF OPCAO = "1"
               OPEN EXTEND NOTAS
               PERFORM INSERIR
               CLOSE NOTAS.

           IF OPCAO = "2"
               DISPLAY "Lista completa dos alunos:"
               OPEN INPUT NOTAS
               PERFORM MOSTRAR TEST AFTER UNTIL SIM-NAO = "N".

           IF OPCAO = "3"
               DISPLAY "Lista dos alunos aprovados:"
               OPEN INPUT NOTAS
               PERFORM ALUNOSAPROVADOS TEST AFTER UNTIL SIM-NAO = "N".

           IF OPCAO = "4"
               DISPLAY "Lista dos alunos reprovados:"
               OPEN INPUT NOTAS
               PERFORM ALUNOSREPROVADOS TEST AFTER UNTIL SIM-NAO = "N".

           IF OPCAO = "5"
               DISPLAY "Programa abortado pelo utilizador. Exit."
               STOP RUN.

               CLOSE NOTAS.
               MOVE "S" TO SIM-NAO.
               PERFORM INICIO.

       INSERIR.
      *     PERFORM OPENING-PROCEDURE.
      *     OPEN EXTEND NOTAS.
           MOVE "S" TO SIM-NAO.
           PERFORM ADD-RECORDS UNTIL SIM-NAO = "N".
      *     PERFORM CLOSING-PROCEDURE.
      *     CLOSE NOTAS.

       AVALIAR.
           EVALUATE MEDIAALUNO
               WHEN 00.00 THRU 04.99
                MOVE "Muito Insuficiente" TO AVALIACAO
               WHEN 05.00 THRU 09.99
                MOVE "Insuficiente" TO AVALIACAO
               WHEN 10.00 THRU 14.99
                MOVE "Suficiente" TO AVALIACAO
               WHEN 15.00 THRU 17.99
                MOVE "Bom" TO AVALIACAO
               WHEN 18.00 THRU 20.00
                MOVE "Muito Bom" TO AVALIACAO
               WHEN OTHER
                DISPLAY "Erro"
           END-EVALUATE.

       AVALIAR88.
           MOVE MEDIAALUNO TO AVALIAR88COND.
               IF MTINSUF
                   MOVE 'Muito Insuficiente' TO AVALIACAO88.
               IF INSUF
                   MOVE 'Insuficiente' TO AVALIACAO88.
               IF SUF
                   MOVE 'Suficiente' TO AVALIACAO88.
               IF BOM
                   MOVE 'Bom' TO AVALIACAO88.
               IF MTBOM
                   MOVE 'Muito Bom' TO AVALIACAO88.

       MOSTRAR.
           READ NOTAS
               AT END
                   MOVE "N" TO SIM-NAO
               NOT AT END
                   PERFORM AVALIAR88
                   DISPLAY NOMEALUNO" "NOTA1" "NOTA2" "NOTA3
                   " Media:"MEDIAALUNO" "AVALIACAO88
           END-READ.

       ALUNOSAPROVADOS.
           READ NOTAS
               AT END
                   MOVE "N" TO SIM-NAO
               NOT AT END
                   PERFORM AVALIAR88
                   IF MEDIAALUNO >= 10
                       DISPLAY NOMEALUNO" "NOTA1" "NOTA2" "NOTA3
                       " Media:"MEDIAALUNO" "AVALIACAO88
           END-READ.

       ALUNOSREPROVADOS.
           READ NOTAS
               AT END
                   MOVE "N" TO SIM-NAO
               NOT AT END
                   PERFORM AVALIAR88
                   IF MEDIAALUNO < 10
                       DISPLAY NOMEALUNO" "NOTA1" "NOTA2" "NOTA3
                       " Media:"MEDIAALUNO" "AVALIACAO88
           END-READ.

       PROGRAM-DONE.
           STOP RUN.

      * OPENING-PROCEDURE.
      *     OPEN EXTEND NOTAS.

      * CLOSING-PROCEDURE.
      *     CLOSE NOTAS.

       ADD-RECORDS.
           MOVE "N" TO ENTRY-OK.
           PERFORM GET-FIELDS UNTIL ENTRY-OK ="S".
           PERFORM ADD-THIS-RECORD.
           PERFORM GO-AGAIN.

       GET-FIELDS.
           MOVE SPACE TO REG-ALUNOS.
           DISPLAY INSIRA-NOME.
           ACCEPT NOMEALUNO.
           DISPLAY INSIRA-NOTA1.
           ACCEPT NOTA1.
           DISPLAY INSIRA-NOTA2.
           ACCEPT NOTA2.
           DISPLAY INSIRA-NOTA3.
           ACCEPT NOTA3.
           COMPUTE MEDIAALUNO = (NOTA1 + NOTA2 + NOTA3)/3.
           DISPLAY "Media: ".
           DISPLAY MEDIAALUNO.
           WRITE MEDIAALUNO.
           PERFORM VALIDATE-FIELDS.

       VALIDATE-FIELDS.
           MOVE "S" TO ENTRY-OK.
           IF NOMEALUNO = SPACE
               DISPLAY "PRECISA SER INSERIDO."
               MOVE "N" TO ENTRY-OK.
           IF NOTA1 > 20
               DISPLAY "ERRO NOTA1. POR FAVOR INSIRA A NOTA DE 0 - 20."
               MOVE "N" TO ENTRY-OK.
           IF NOTA2 > 20
               DISPLAY "ERRO NOTA2. POR FAVOR INSIRA A NOTA DE 0 - 20."
               MOVE "N" TO ENTRY-OK.
           IF NOTA3 > 20
               DISPLAY "ERRO NOTA3. POR FAVOR INSIRA A NOTA DE 0 - 20."
               MOVE "N" TO ENTRY-OK.

       ADD-THIS-RECORD.
           WRITE REG-ALUNOS.

       GO-AGAIN.
           DISPLAY "Prima Zero(0) para sair.".
           DISPLAY "Qualquer outra tecla para continuar".
           ACCEPT SIM-NAO.
           IF SIM-NAO = "0"
      *         MOVE "N" TO SIM-NAO
               CLOSE NOTAS
               MOVE "S" TO SIM-NAO
               PERFORM INICIO.
           IF SIM-NAO NOT = "0"
      *         CLOSE NOTAS
               PERFORM INSERIR.
       END PROGRAM programa29.
