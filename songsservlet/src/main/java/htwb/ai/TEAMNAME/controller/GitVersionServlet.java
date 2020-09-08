package htwb.ai.TEAMNAME.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

@WebServlet(urlPatterns = "/version", name = "gitversionservlet")
public class GitVersionServlet extends HttpServlet {

    private static final long serialVersionUID = 8957796183646892771L;
    
    private String gitVersion;

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        try (InputStream in = this.getClass().getClassLoader().getResourceAsStream("git.properties")) {
            gitVersion = IOUtils.toString(in, StandardCharsets.UTF_8);
        } catch (IOException e) {
            gitVersion = "Could not load git.properties, check logs!";
            e.printStackTrace();
        }
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        try (PrintWriter out = response.getWriter()) {
            out.println(gitVersion);
        }
    }

    protected String getGitVersion() {
        return this.gitVersion;
    }
}
