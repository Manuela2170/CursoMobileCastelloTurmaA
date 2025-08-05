# Guia definitivo sobre GIT e GITHUB

## Preparação Inicial de Versionamento

- 1° Passo - Instalar o GIT => Software de Versionamento
- 2° Passo - Configurar o GIT
    - git config --global user.name "Meuusername"
    - git config --global user.email "meu@email.com"
- 3° Passo - Iniciar o Repositorio dentro do Projeto (.git)
    - git init
- 4° Passo - Sincronizar o GIT com GITHUB
    - Criar um repositório no GITHUB
    - git remote add origin "endereço do Repositorio"
- 5° Passo - Adicionar Arquivos ao Repositório local (GIT)
    - git add . ( vai adicionar todos os arquivos ao repositorio)
- 6° Passo - Criar a versão local
    - git commit -m "meu texto"
- 7° Passo - Enviar para o GITHUB (nuvem)
    - git push -u origin main
- 8° Passo - Atualizar repositorio local com arquivos da Nuvem
    - git pull 
- 9° Passo - Clonar meu repositorio da nuvem
    - git clone "endereço do repositorio online"