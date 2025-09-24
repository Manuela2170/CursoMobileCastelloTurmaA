package model;

public abstract class Pessoa {
    //atributos(ENCAPSULAMENTO)
    private String nome;
    private String cpf;

    //Métodos
    // construor

    public Pessoa (String nome, String cpf){
    this.nome = nome;
    this.cpf = cpf;
}

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
}
///getter and setter

//exibir informações
public void exibirinformacoes(){
    System.out.println("nome: "+nome);
    System.out.println("CPF: "+cpf);
}
}