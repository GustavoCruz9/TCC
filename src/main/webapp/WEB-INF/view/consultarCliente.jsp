<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   	<link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/styleConsultarCliente.css"/>'> 
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
    <title>Perpétua Beleza e Estética - Consultar Clientes</title>
  </head>
  <body>
    <nav class="sidebar close">
      <header>
        <div class="imagem-texto">
          <i class="bx bx-menu sandwich"></i>

          <div class="texto header-texto">
            <span class="salao">Perpétua Beleza e Estética</span>
          </div>
        </div>
      </header>

      <div class="menu-bar">
        <div class="menu">
          <ul class="menu-links">
            <li class="nav-link">
              <a href="consultarAgendamentoFuncionario">
                <i class='bx bxs-calendar icon'></i>
                <span class="texto nav-texto">Meus Agendamentos</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="consultarCliente">
                <i class='bx bx-smile icon'></i>
                <span class="texto nav-texto">Clientes</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="cancelarHorario">
                <i class='bx bx-time-five icon'></i>
                <span class="texto nav-texto">Meu horário</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="cadastrarServicoProprietaria">
                <i class='bx bx-cut icon'></i>
                <span class="texto nav-texto">Cadastrar Serviços</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="cadastroFuncionarioProprietaria">
                <i class='bx bxs-user-plus icon'></i>
                <span class="texto nav-texto">Funcionarios</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="cadastroProdutoProprietaria">
                <i class='bx bxs-package icon'></i>
                <span class="texto nav-texto">Produtos</span>
              </a>
            </li>
            <li class="nav-link">
              <a href="meusDadosFuncionario">
                <i class='bx bx-user-circle icon'></i>
                <span class="texto nav-texto">Meus Dados</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
      
      <div class="baixo">
        <li class="">
          <a href="#">
            <i class="bx bx-log-out icon"></i>
            <span class="texto nav-texto">Logout</span>
          </a>
        </li>
      </div>
    </nav>

    <div id="error-container"></div>
    <div id="success-container"></div>

    <section class="content">
      <c:if test="${not empty mensagemSucesso}">
			<script src="./resources/js/consultarCliente.js"></script>
			<script>
				displaySuccessMessage("${mensagemSucesso}");
			</script>
		</c:if>

		<c:if test="${not empty mensagemErro}">
			<script src="./resources/js/consultarCliente.js"></script>
			<script>
				displayErrorMessage("${mensagemErro}");
			</script>
		</c:if> 
		
    <form action="consultarCliente" method="post">
      <div class="search-bar">
        <h2>Clientes</h2>
        <div class="search">
          <input type="text" id="nome" name="nome" placeholder="Buscar Nome da cliente" />
          <button type="submit" class="btn-icon" id="botao" name="botao" value="Pesquisar">
            <i class="bx bx-search icone-pesquisa"></i>
          </button>
        </div>
      </div>

      <div class="tabela-container">
      	<c:if test="${not empty clientes }">
        <table>
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Ficha</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="c" items="${clientes }">
                <tr>
                    <td>${c.nome }</td>
                    <td>${c.cpf }</td>
                    <td>
                      <form action="consultarCliente" method="post">
                      	<input type="hidden" id="idCliente" name="idCliente" value="${c.id }" />
                        <input type="submit" id="botao" name="botao" class="btn" value="Ver Ficha">
                      </form>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        </c:if>
    </div>

    </form>
    
    </section>

    <script src="./resources/js/consultarCliente.js"></script>
  </body>
</html>
