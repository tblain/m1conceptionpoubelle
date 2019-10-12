<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <title>Billet</title>
</head>
<body>
<%  List<String> commentaires = new ArrayList<>();
    if (request.getMethod().equals("POST")) {
    String commentaire = request.getParameter("commentaire");

    commentaires.add(commentaire);
    pageContext.setAttribute("listeCommentaires",commentaires);
} %>
<h2>Hello <%= session.getAttribute("pseudo")%> !</h2>
<p><c:out value="Ceci est un billet de ${billet.auteur}"/></p>
<h1><c:out value="${billet.titre}"/></h1>
<div class="contenu">
    <c:out value="${billet.contenu}"/>
</div>
<hr>
<c:forEach items="${billet.commentaires}" var="item">
    ${item}<br>
</c:forEach>
<%-- TODO: Le billet disparait au submit du commentaire car on recharge la page et il n'y a pas de sauvegarde en bd donc c'est effacé --%>
<%-- TODO: Faire en sorte que ça marche avec servlets ou alors on continue sans servlets et on fait tout sur billet.jsp comme le prof avait fait--%>
</p>
<hr>
<form method="post" action="Billet">
    <p>
        Commentaire :
        <input type="text" id="commentaire" name="commentaire">
        <input type="submit" value="Envoyer">

    </p>
</form>
<p><a href="Billet">Saisir un nouveau billet</a></p>
<p><a href="Deco">Se déconnecter</a></p>

</body>
</html>
