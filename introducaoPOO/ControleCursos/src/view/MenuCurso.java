package view;

import java.util.Scanner;

import controle.Curso;
import model.Professor;
public class MenuCurso {
    //Atributos
    private boolean continuar = true;
    @SuppressWarnings("unused")
    private int Operacao;
    Scanner sc = new Scanner(System.in);
    //método
    @SuppressWarnings("unused")
    public void menu(){
        //instancia curso e professor
        Professor professor = new Professor("José Pereira", "123.456.789-10", 15000.00);
        @SuppressWarnings("unused")
        Curso curso = new Curso("Programação Java", professor);

        while (continuar) {
            System.out.println("Sistema de Gestão escolar====");
            System.out.println("1.Cadastrar Aluno no Curso");
            System.out.println("2.Informações do Curso");
            System.out.println("3.Status da Turma");
            System.out.println("4.Sair");
            System.out.println("Escolha a Opção Desejada");
            Operacao = sc.nextInt();
            switch (Operacao) {
                case 1:
                System.out.println("Informe o Nome Do Aluno");
                    int nomeAluno = sc.nextInt();
                    System.out.println("Informe O Cpf do Aluno");
                    String cpfAluno = sc.next();
                    System.out.println("Informe o Número da Matriculo");
                    String matriculaAluno = sc.next();
                    System.out.println("Informe a Nota do Aluno");
                    double notaAluno = sc.nextDouble();
                    curso.adicionarAluno(null);
                    break;

                case 2:
                   curso.exibirinformacoesCurso();
                    break;

                case 3://a fazer
                break;

                case 4:
                System.out.println("Saindo.....");
                continuar = false;
                break;

                default:
                System.out.println();
                    break;
            }
        }
    }
}