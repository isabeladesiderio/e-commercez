/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ProdutosDAO;

/**
 *
 * @author Isabela
 */

@WebServlet("/produto")
public class Produto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        
        String url = "/views/produto.jsp";
        
        //Instanciando DAO
        ProdutosDAO prod = new ProdutosDAO();
        
        //Colocando dados do produto na requisi��o
        request.setAttribute("produto", prod.getById(request.getParameter("id")));
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String query = (String) request.getParameter("query");
        String marca = (String) request.getParameter("marca");
        String search = (String) request.getParameter("search");
        
        String imagem = (String) request.getParameter("imagem");
        String titulo = (String) request.getParameter("titulo");
        String descricao = (String) request.getParameter("descricao");
        String vendedor = (String) request.getParameter("vendedor");
        String quantidade = (String) request.getParameter("quantidade");
        String endereco = (String) request.getParameter("endereco");
        String telefone = (String) request.getParameter("telefone");
        String preco = (String) request.getParameter("preco");
        
        //Instanciando o DAO
        ProdutosDAO prod = new ProdutosDAO();
        
        String json = "";
        
        switch(query){
            case "produtos":
                json = new Gson().toJson(prod.getProdutos(marca, search));
                break;
            case "marcas":
                json = new Gson().toJson(prod.getMarcas());
                break;
            case "search":
                json = new Gson().toJson(prod.getBySlug(search));
                break;
            case "cadastro":
                json = new Gson().toJson(prod.register(imagem, titulo, descricao, vendedor, quantidade, endereco, telefone, preco));
                break;
        }
        
        out.print(json);

    }
    
}
