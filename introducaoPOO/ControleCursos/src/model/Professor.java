package model;

public class Professor extends Pessoa {
    //atributos encapsulamento
    private double Salario;
    
    public Professor(String nome, String cpf, double salario) {
        super(nome, cpf);
        Salario = salario;
    }
    public double getSalario() {
        return Salario;
    }
    public void setSalario(double salario) {
        Salario = salario;
    }
    @Override
    public void exibirinformacoes(){
        super.exibirinformacoes();
        System.out.println("Salario: R$ "+Salario);

    }
}
