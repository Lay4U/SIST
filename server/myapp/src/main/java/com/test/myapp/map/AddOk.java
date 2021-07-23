package com.test.myapp.map;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/map/addok.do")
public class AddOk extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String lat = req.getParameter("lat");
        String lng = req.getParameter("lng");
        String name = req.getParameter("name");

        MapDAO dao = new MapDAO();
        MapDTO dto = new MapDTO();

        dto.setLat(lat);
        dto.setLng(lng);
        dto.setName(name);

        dao.add(dto);

        //3.
        resp.sendRedirect("/myapp/map/map.do?no=ex04");
    }
}














