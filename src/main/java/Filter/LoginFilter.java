package Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;

public class LoginFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain cc)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) arg0;
		HttpServletResponse resp=(HttpServletResponse) arg1;
		
		if(check(req.getRequestURI())) {
			cc.doFilter(arg0, arg1);
			
		}else {
			if(req.getRequestURI().equals("login.jsp")||req.getRequestURI().equals("User/login")||req.getRequestURI().equals("operator/login")||req.getSession().getAttribute("user")!=null||req.getSession().getAttribute("operator_id")!=null) {
				cc.doFilter(arg0, arg1);
			}else {
				resp.sendRedirect("/situ_maneger/login.jsp");
			}
		}
			
			
	}
private boolean check(String url) {//路径
		for(int i=0;i<remove.length;i++) {
			if(url.endsWith(remove[i])) return true;
		}
		return false;
	}
String [] remove=new String [0];//防止拿不到参数
	public void init(FilterConfig fc) throws ServletException {
		remove=fc.getInitParameter("remove").split(",");//初始过滤排除设置的---web.xml
		
	}

}
