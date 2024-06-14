const automacao = document.getElementById('automacao');
const desenvolvimento = document.getElementById('desenvolvimento');
const banco = document.getElementById('banco');
const linguagem = document.getElementById('linguagem');
const ciencia = document.getElementById('ciencia');


function carregarPagina(url) {
    document.getElementById("conteudoFrame").src = url;
}

automacao.addEventListener('click', ExibirAI);
desenvolvimento.addEventListener('click', ExibirDevWeb);
banco.addEventListener('click', ExibirBancoDeDados);
botaoLinguagemDeProg.addEventListener('click', ExibirLinguagemDeProg);
botaoCienciaDeDados.addEventListener('click', ExibirCienciaDeDados);
botaoPOO.addEventListener('click', ExibirPOO);

function ExibirAI() {
    carregarPagina("/automacao/automacao.html");
    
}

function ExibirDevWeb() {
    carregarPagina("desenvolvimento.html")
   
}

function ExibirBancoDeDados() {
    carregarPagina("/BancoDeDados/BD.html")
    
}

function ExibirLinguagemDeProg() {
    carregarPagina("/LinguagemProg/LP.html")
    
}

function ExibirCienciaDeDados() {
    carregarPagina("/CienciaDeDados/CD.html")
}

function ExibirPOO() {
    carregarPagina("/POO/POO.html")
    
}