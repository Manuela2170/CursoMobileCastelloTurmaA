package model;

public class Aluno extends Pessoa {
    //atributos encapsulamento
    private String matricula;
    private double nota;
    public Aluno(String nome, String Cpf, String matricula, double nota) {
        super(nome, Cpf);
        this.matricula = matricula;
        this.nota = nota;
    }
    //getters and setters
    public String getMatricula() {
        return matricula;
    }
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }
    public double getNota() {
        return nota;
    }
    public void setNota(double nota) {
        this.nota = nota;
    }

    @Override
    public void exibirinformacoes(){
        super.exibirinformacoes();
        System.out.println("Matricula: "+matricula);
        System.out.println("Nota: "+nota);

    }
    
}
