package Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthorityFilter",
        urlPatterns = {"/backlove.jsp","/exhibitManager.jsp","/friends.jsp","/personalpage.jsp","/selfManage.jsp","/userManage.jsp","/email.jsp"}
        )
public class AuthorityFilter extends HttpFilter{
    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        String url = request.getRequestURI();

        HttpSession session = request.getSession();

        /* 首先检查是否登录 */

        //如果未登录
        if(session.getAttribute("me") == null){
            System.out.println("您还未登录，没有权限访问该页！");
            response.sendRedirect("log.jsp");
        }

        //如果用户已经登录，那么还要看访问的页面是不是人员管理和作品管理
        else {
            int idx = url.lastIndexOf("/");
            String endWith = url.substring(idx + 1);

            //如果是人员管理与作品管理，检查
            if(endWith.equals("exhibitManager.jsp") || endWith.equals("userManage.jsp")){
                if(session.getAttribute("permission") != "true"){
                    System.out.println("您不是管理员，没有权限访问该页！");
                    response.sendRedirect("homepage.jsp");
                }
                else
                    filterChain.doFilter(request,response);
            }

            //如果不是人员管理与作品管理，直接下一步
            else
                filterChain.doFilter(request,response);
        }

    }
}
