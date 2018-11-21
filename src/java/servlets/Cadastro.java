/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Murah
 */
@WebServlet("/cadastro")
public class Cadastro extends HttpServlet {
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/cadastro.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String login = request.getParameter("login");
        String password = request.getParameter("password");
       
        if(Mensagem.OK.equals(resp)){
                    response.sendRedirect("login.jsp");
                }
                else{
                    response.sendRedirect("mensagem_erro.jsp?msg="+resp);
                }
        
        
        
    }
    
}
