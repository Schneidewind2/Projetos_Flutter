# atv_crud_aluno

    Projeto final da disciplina "Programação de Dispositivos Móveis"

## Objetivo do trabalho
    Demonstrar habilidade para desenvolvimento de aplicação com Flutter;
    Acesso a algum banco de dados;
    Demonstrar conhecimento dos seguintes aspectos de programação:
    Uso adequado de Orientação a objetos.

## Trabalho proposto
    Escrever um aplicativo Flutter para gerenciar atividades. É necessário utilizar um banco de dados.
    1ª Parte: Tela inicial com atividades cadastradas, Será possível  clicar em cada atividade para fazer sua edição/alteração.
    Também será possível excluir uma determinada atividade.

    2ª Parte: Também existirá um menu para "cadastrar atividade"

    Tela de cadastro de atividade: Tela para cadastrar uma determinada atividade. A atividade terá as seguintes informações:
         - Título da atividade;
         - Descrição da atividade;
         - Duração da atividade (em minutos, caso seja atividade física);
         - Data da atividade;

    Tela de edição de atividade: Uma tela para fazer edição das atividades cadastradas.

## Trabalho feito
    Foi escrito um aplicativo em Flutter minimalista para cadastro de alunos.
    A implementação do banco de dados foi feita através do pacote "Floor", que fornece uma abstração SQLite pura.
    Implementação de telas: 
        Splash Screen com Logotipo da Instituição em que estudo, 
        Tela inicial do app com logotipo horizontal ao topo, nome da aplicação, imagem com desenho de pessoas e botão de "entrar", 
        Tela de listagem de alunos (com botão para adicionar registro). Mostrando Nome do aluno e Curso matriculado,
        Tela adição de registro (Com botão salvar e reiniciar campos),
        Tela edição de registro  (Com botão salvar). Acessada ao tocar no ícone de "Caneta" no card do aluno,
        Tela Detalhes do aluno, com botão excluir(ícone lixeira) no canto direito da appBar.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
