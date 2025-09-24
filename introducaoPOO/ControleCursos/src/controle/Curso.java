package controle;

import java.util.List;

import model.Aluno;
import model.Professor;
import java.util.ArrayList;

public class Curso {
    private String nomeCurso;
    private Professor professor;
    private List<Aluno> Alunos;

    public Curso(String nomeCurso, Professor professor) {
        this.nomeCurso = nomeCurso;
        this.professor = professor;
        Alunos = new ArrayList<>();
    }

    public void adicionarAluno(Aluno aluno){
        Alunos.add(aluno);
    }

    //Exiber informaçõescurso
    public void exibirinformacoesCurso(){
        System.out.println("Nome do Curso: "+nomeCurso);
        System.out.println("Nome professor:"+professor.getNome());
        //foreach
        int contador = 0;
        System.out.println("====================");
        for (Aluno aluno : Alunos) {
            contador++;
            System.out.println(contador+". "+aluno.getNome());
        }
        System.out.println("====================");

    }
}
