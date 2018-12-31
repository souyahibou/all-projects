// Au click sur le bouton, afficher la barre de recherche

var Elmts=document.getElementById("CorpsText");
var Butt=document.getElementById("CorpsButt");
var ActButt=document.getElementById("Bouton2Masque");

ActButt.onclick= function() {
                              Elmts.style.display="block";
                              Butt.style.display="none";
};




//Renvoyer vers une recherche google lorsque l"on appuie sur le bouton recherche

var boutonRecherche=document.getElementById("boute");

boutonRecherche.onclick= function(){
                                      var x = document.forms["barrederecherche"].elements["Rechercher"];
                                      var y= x.value;

                                      var arrayOfStrings = y.split(" ");

                                      var z="";
                                      for (var i in arrayOfStrings)
                                        z=z+"+"+arrayOfStrings[i];
                                        z=z.substring(1);

                                      window.location.href = "https://www.google.fr/#q="+z;
}



// FAIRE UN POP UP QUI APPARAIT AU BOUT DE 10 SECONDE VERS UN SITE XXX - DougThePug <3


onLoad=setTimeout("popuper()",10000)

var popuper = function(){
pub = window.open("popup.html","Meilleur site ever",
"height=200, width=400, top=300, left=500, toolbar=no, menubar=no, location=no, resizable=yes, scrollbars=yes, status=no, directories=no");
}


debugger;
