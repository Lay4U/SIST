package travel.search;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 키워드 검색 서블릿 
 * @author 이준희
 *
 */
@WebServlet("/search/keyword.do")
public class Keyword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/search/keyword.jsp");
        dispatcher.forward(req, resp);

    }//doGet

}//class