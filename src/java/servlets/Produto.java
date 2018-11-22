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
        
        //Colocando dados do produto na requisição
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
        }
        
        out.print(json);

    }
    
}
