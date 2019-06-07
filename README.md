### Java web course mini project - Media blog
##### Pages for JSP:
  >1) header.jsp: Have to consider if it's admin page or not - <b>created</b>
  >2) footer.jsp: Have to consider if it's login or not -<b>created</b>
  >3) index.jsp: Give it a jumbotrum section, list most recent posts(say 5 posts) - <b>created</b>
  >4) about.jsp: Need to present informations of all register author - <b>created</b>
  >5) list.jsp: List all posts available(need to have pagination function?) - <b>created</b>
  >6) single.jsp: Detail page of a single post - <b>created</b>
  >7) login.jsp: only need html?? - <b>created</b>
  >>  (the header.jsp and footer.jsp needs to decide if it's login page or not to generate different views)
  >8) signup.jsp: only need html?? - <b>created</b>
  >>  (the header.jsp and footer.jsp needs to decide if it's login page or not to generate different views)
  >9) admin.jsp: List all posts of the current user(click delete to generate the right confirm modal for the clicked post) - <b>created</b>
  >>  (the header.jsp and footer.jsp needs to decide if it's login page or not to generate different views)
  >10) form.jsp: Form of creating or editing a post(using wysiwyg editor) - <b>created</b>
  >>  (the header.jsp needs to determine weither to add the jodit css and js when it is a form page)
  >>  (the footer.jsp needs to determine weither to generate a different footer for form page)
  >>1) create: Creating post...(using wysiwyg editor)
  >>2) edit: Editing post(need to fill out all original data in the fields)
  >11) profile.jsp: To edit the author profile

##### Java source code 
  > com.lauren.miniblog.dao - <b>Maybe still needs some adjustment</b>
  >> -- UserDAO.java
  >> -- PostDAO.java
  >> -- DBConnection.java - A ServletContext Listener to set database connection into ServletContext object<br>
  > com.lauren.miniblog.model - <b>Maybe still needs some adjustment</b><br>
  >> -- User.java
  >> -- Post.java


##### WebContent/WEB-INF/lib
  > Adding jar files from tutorial project - <b>Maybe needs to adjust some version of jar file</b>
