package com.example.myapp2;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Une servlet pour les actions sur les personnes.
 */
@WebServlet(//
        description = "Les actions sur les personnes", //
        urlPatterns = {"/person", "/deletePerson", "/addPerson"})
public class PersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final PersonManager manager = new PersonManager();

    /**
     * Requêtes GET
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) //
            throws IOException, ServletException {
        if (request.getServletPath().equals("/deletePerson")) {
            manager.remove(request.getParameter("id"));
            response.sendRedirect("person");
            return;
        }

        if (request.getSession().getAttribute("errors") == null) {
            request.setAttribute("errors", new HashMap<String, String>());
        } else {
            request.setAttribute("errors", request.getSession().getAttribute("errors"));
        }

        // case of add user
        if (request.getServletPath().equals("/addPerson")) {
            Person p = new Person();
            request.setAttribute("person", p);
            request.getRequestDispatcher("edition.jsp").forward(request, response);
        }

        if (request.getParameter("id") != null && !request.getParameter("id").equals("null")) {
            Person person = manager.find(request.getParameter("id"));
            request.setAttribute("person", person);
            request.getSession().setAttribute("id", person.getId());
            request.getRequestDispatcher("edition.jsp").forward(request, response);
        } else {
            request.setAttribute("persons", manager.findAll());
            request.getRequestDispatcher("lister.jsp").forward(request, response);
        }

//        var writer = response.getWriter();
//        writer.printf("<p>");
//        // afficher les informations sur la requête
//        writer.printf("method = %s</br>", request.getMethod());
//        writer.printf("contextPath = %s</br>", request.getContextPath());
//        writer.printf("servletPath = %s</br>", request.getServletPath());
//        // afficher les paramètres et leurs valeurs
//        writer.printf("'a' parameter = %s</br>", request.getParameter("a"));
//        request.getParameterMap().forEach((param, values) -> {
//            writer.printf("parameter '%s' = %s</br>", param, String.join(", ", values));
//        });
    }

    /**
     * Requêtes POST (la même chose que GET)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) //
            throws ServletException, IOException {


        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String mail = request.getParameter("mail");
        Person person = new Person(id, name, mail);
        Map<String, String> errors = manager.validate(person);

        if (!errors.isEmpty()) {
            request.getSession().setAttribute("errors", errors);
            System.out.println(errors);
            response.sendRedirect("person?id=" + request.getSession().getAttribute("id"));
            return;
        }

        // check if it is an update
        boolean update = request.getSession().getAttribute("id") != null;
        if (update) {
            manager.remove((String) request.getSession().getAttribute("id"));
        }

        manager.save(person);
        response.sendRedirect("person");
    }

}
