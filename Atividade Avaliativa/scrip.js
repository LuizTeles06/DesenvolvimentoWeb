[]
var proximoId = 1;


function adicionarFilme(event) {
    event.preventDefault();
  
    var comedia = document.querySelector('.comedia').value;
    var terror = document.querySelector('.terror').value;
    var acao = document.querySelector('.acao').value;

    
    if (comedia === '' || terror === '' || acao === '') {
        alert('Por favor, preencha todos os campos!');
        return;
    }

    var tabela = document.querySelector('.tabela');

  
    var novaLinha = tabela.insertRow();

    
    novaLinha.dataset.id = proximoId++;


    var celulaComedia = novaLinha.insertCell();
    var celulaTerror = novaLinha.insertCell();
    var celulaAcao = novaLinha.insertCell();

    celulaComedia.textContent = comedia;
    celulaTerror.textContent = terror;
    celulaAcao.textContent = acao;

    
    var botaoEditar = document.createElement('button');
    botaoEditar.textContent = 'Editar';
    botaoEditar.onclick = function() { editarFilme(novaLinha); };
    celulaAcao.appendChild(botaoEditar);

    var botaoApagar = document.createElement('button');
    botaoApagar.textContent = 'Apagar';
    botaoApagar.onclick = function() { apagarFilme(novaLinha); };
    celulaAcao.appendChild(botaoApagar);

    
    document.querySelector('.comedia').value = '';
    document.querySelector('.terror').value = '';
    document.querySelector('.acao').value = '';
}


function editarFilme(linha) {
    var celulas = linha.getElementsByTagName('td');
    var comedia = celulas[0].textContent;
    var terror = celulas[1].textContent;
    var acao = celulas[2].textContent;

   
    document.querySelector('.comedia').value = comedia;
    document.querySelector('.terror').value = terror;
    document.querySelector('.acao').value = acao;

    
    linha.parentNode.removeChild(linha);
}


function apagarFilme(linha) {
    linha.parentNode.removeChild(linha);
}


var formulario = document.querySelector('#meuForm');


formulario.addEventListener('submit', adicionarFilme);