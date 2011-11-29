<%@page contentType="text/plain" pageEncoding="UTF-8"
%>AuthType: <%= request.getAuthType() %>
ContextPath: <%= request.getContextPath() %>
Cookies:
<%
Cookie[] cookies = request.getCookies();
for (int i=0; i<cookies.length; i++) {
  Cookie cookie = cookies[i];
%>
  Comment: <%= cookie.getComment() %>
  MaxAge: <%= cookie.getMaxAge() %>
  Name: <%= cookie.getName() %>
  Path: <%= cookie.getPath() %>
  Secure: <%= cookie.getSecure() %>
  Value: <%= cookie.getValue() %>
  Version: <%= cookie.getVersion() %>
<%
     }
%>

Headers:
<%
for (java.util.Enumeration headers = request.getHeaderNames(); headers.hasMoreElements();) {
  String header = (String)headers.nextElement();
    %>  <%= header %>: <%= request.getHeader(header)%>
<%
     }
%>
Method: <%= request.getMethod() %>
PathInfo: <%= request.getPathInfo() %>
PathTranslated: <%= request.getPathTranslated() %>
QueryString: <%= request.getQueryString() %>
RemoteUser: <%= request.getRemoteUser() %>
RequestedSessionId: <%= request.getRequestedSessionId() %>
RequestURI: <%= request.getRequestURI() %>
RequestURL: <%= request.getRequestURL() %>
Session: <%= request.getSession(false) %>
UserPrincipal: <%= request.getUserPrincipal() %>
isRequestedSessionIdFromCookie: <%= request.isRequestedSessionIdFromCookie() %>
isRequestedSessionIdFromURL: <%= request.isRequestedSessionIdFromURL() %>
isRequestedSessionIdValid: <%= request.isRequestedSessionIdValid() %>
