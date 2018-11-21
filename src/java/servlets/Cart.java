/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.Carrinho;
import classes.Produto;
import com.google.gson.Gson;
import dao.ProdutosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Isabela
 */

@WebServlet("/cart")
public class Cart extends HttpServlet {
    
    private boolean in_array(ArrayList<Carrinho> array, int index){
        boolean exist = false;
        for(int i = 0; i < array.size(); i++){
            if(array.get(i).getProduto().getId() == index){
                exist = true;
            }
        }
        return exist;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();        
        HttpSession session = request.getSession();
        
        String url = "/views/cart.jsp";
        
        request.setAttribute("cart", (ArrayList<Carrinho>) session.getAttribute("cart"));
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        
        int produto = Integer.parseInt(request.getParameter("produto"));
        
        ArrayList<Carrinho> cart = (ArrayList<Carrinho>) session.getAttribute("cart");
        if(cart == null){
            cart = new ArrayList<Carrinho>();
        }

        if(in_array(cart, produto)){
            for(int i = 0; i < cart.size(); i++){
                if(cart.get(i).getProduto().getId() == produto){
                    int quantidade = cart.get(i).getQuantidade();
                    quantidade++;
                    cart.get(i).setQuantidade(quantidade);
                }
            }
            
            session.setAttribute("cart", cart);
        }else{
            ProdutosDAO dao = new ProdutosDAO();
            Produto prod = dao.getById(produto+"");

            //Adicionando o item ao carrinho
            Carrinho item = new Carrinho();
            item.setQuantidade(1);
            item.setProduto(prod);

            cart.add(item);

            session.setAttribute("cart", cart);
        }

        out.print(new Gson().toJson(true));
        
    }
    
}
