package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SecurityFilter
 */
@WebFilter("/*")
public class SecurityFilter implements Filter {

    /**
     * Default constructor. 
     */
    public SecurityFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	private HttpServletRequest httpRequest;

    // private HttpServletResponse httpRespone;
	 
    private static final String[] loginRequiredURLs = {
            "/view_profile", "/edit_profile", "/update_profile"
    };
	@Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        httpRequest = (HttpServletRequest)req;
//        httpRespone = (HttpServletResponse)resp;
		 
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        HttpSession session = httpRequest.getSession(false);
        
        if (path.startsWith("/admin/")) {        	 
            boolean isLoggedIn = (session != null && session.getAttribute("adminUser") != null);
     
            String loginURI = httpRequest.getContextPath() + "/admin/login";
            boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
            boolean isLoginPage = httpRequest.getRequestURI().endsWith("login.jsp");
     
            if (isLoggedIn && (isLoginRequest || isLoginPage)) {
                // the user is already logged in and he's trying to login again
                // then forward to the homepage
                httpRequest.getRequestDispatcher("/admin").forward(req, resp);
     
            } else if (isLoggedIn || isLoginRequest) {
                // continues the filter chain
                // allows the request to reach the destination
                chain.doFilter(req, resp);
     
            } else {
                // the admin is not logged in, so authentication is required
                // forwards to the Login page
                RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
                dispatcher.forward(req, resp);
     
            }
        }
        else {
        	
	        boolean isLoggedIn = (session != null && session.getAttribute("customerUser") != null);
	 
	        String loginURI = httpRequest.getContextPath() + "/login";
	        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
	        boolean isLoginPage = httpRequest.getRequestURI().endsWith("login.jsp");
	 
	        if (isLoggedIn && (isLoginRequest || isLoginPage)) {
	            // the user is already logged in and he's trying to login again
                // then forward to the homepage
                // httpRespone.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                // httpRespone.setHeader("Location", "/");
	            httpRequest.getRequestDispatcher("/").forward(req, resp);
	 
	        } else if (!isLoggedIn && isLoginRequired()) {
	            // the user is not logged in, and the requested page requires
	            // authentication, then forward to the login page
	            String loginPage = "/login.jsp";
	            RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginPage);
	            dispatcher.forward(req, resp);
	        } else {
	            // for other requested pages that do not require authentication
	            // or the user is already logged in, continue to the destination
	            chain.doFilter(req, resp);
	        }
        }
    }
 
 
    private boolean isLoginRequired() {
        String requestURL = httpRequest.getRequestURL().toString();
 
        for (String loginRequiredURL : loginRequiredURLs) {
            if (requestURL.contains(loginRequiredURL)) {
                return true;
            }
        }
 
        return false;
    }
 
    @Override
    public void init(FilterConfig fConfig) throws ServletException {
 
    }

}
