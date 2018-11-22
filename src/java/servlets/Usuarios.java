/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.google.gson.Gson;
import dao.ProdutosDAO;
import dao.UsuariosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Isabela Desiderio
 */

   @WebServlet("/adashboard")
public class Usuarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        
        String url = "/admin/adashboard.jsp";
        
        //Instanciando DAO
        UsuariosDAO usuarios = new UsuariosDAO();
        UsuariosDAO produto = new UsuariosDAO();
        //Colocando dados do produto na requisição
        request.setAttribute("usuarios", usuarios.getUsuarios(request.getParameter("query")));
        request.setAttribute("produto", produto.getProdutos(request.getParameter("query")));
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String query = (String) request.getParameter("query");
        
        //Instanciando o DAO
        UsuariosDAO usuarios = new UsuariosDAO();
        UsuariosDAO produto = new UsuariosDAO();
        
        String json = "";
        
        switch(query){
            case "usuarios":
                json = new Gson().toJson(usuarios.getUsuarios(query));
                break;
           
            case "produto":
                json = new Gson().toJson(produto.getProdutos(query));
                break;
            
        }
        
        out.print(json);

    }
    
}
   

