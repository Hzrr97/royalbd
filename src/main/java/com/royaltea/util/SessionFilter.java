package com.royaltea.util;

import javax.servlet.*;
import javax.servlet.http.*;

import com.royaltea.pojo.Emp;
import com.sun.tools.internal.ws.processor.model.Response;

import java.io.*;

public class SessionFilter implements Filter {
	public void destroy() {
	}

public void doFilter(ServletRequest sreq, ServletResponse response,

	FilterChain chain)

	throws IOException, ServletException {
	HttpServletRequest hrequest = (HttpServletRequest) sreq;
	HttpServletRequest  rq= (HttpServletRequest)sreq;
	HttpServletResponse  rp= (HttpServletResponse)response;
    String uri = hrequest.getRequestURI();
    
    if (uri.indexOf("login.jsp")>0 ||uri.indexOf("emp-login")>0 || uri.indexOf("error.jsp")>0||uri.indexOf("upload")>0){
    	chain.doFilter(sreq, response);
    }else {
    	Emp emp=(Emp)rq.getSession().getAttribute("emp");
	    if(null==emp){  
	      rp.sendRedirect("/royalbd/error.jsp");
	    }else{
	    chain.doFilter(sreq, response);
	    }
    }
}

	public void init(FilterConfig filterConfig) throws ServletException {
	}
}