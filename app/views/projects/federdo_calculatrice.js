function add(a, b) {
	return a + b;
}

function add(a, b) {
	return a * b;
}

function add(a, b) {
	return a / b;
}

function add(a, b) {
	return a - b;
}




//document.querySelector retourne le premier élément dans le document correspondant au sélecteur ou groupe de sélecteurs, spécifié ou null si aucune correspondance n'est trouvée.
document.querySelector('#one').onclick = function() {
  document.getElementById("screen").innerHTML+= '1';
}
//innerHTML récupère ou définit tout le balisage et le contenu au sein d'un élément donné.

document.querySelector('#two').onclick = function() {
  document.getElementById("screen").innerHTML+= '2';
}
document.querySelector('#three').onclick = function() {
  document.getElementById("screen").innerHTML+= '3';
}
document.querySelector('#sum').onclick = function() {
  document.getElementById("screen").innerHTML+= '+';
}
document.querySelector('#four').onclick = function() {
  document.getElementById("screen").innerHTML+= '4';
}
document.querySelector('#five').onclick = function() {
  document.getElementById("screen").innerHTML+= '5';
}
document.querySelector('#six').onclick = function() {
  document.getElementById("screen").innerHTML+= '6';
}
document.querySelector('#subtract').onclick = function() {
  document.getElementById("screen").innerHTML+= '-';
}
document.querySelector('#seven').onclick = function() {
  document.getElementById("screen").innerHTML+= '7';
}
document.querySelector('#eight').onclick = function() {
  document.getElementById("screen").innerHTML+= '8';
}
document.querySelector('#nine').onclick = function() {
  document.getElementById("screen").innerHTML+= '9';
}
document.querySelector('#multiply').onclick = function() {
  document.getElementById("screen").innerHTML+= 'x';
}
document.querySelector('#zero').onclick = function() {
  document.getElementById("screen").innerHTML+= '0';
}

document.querySelector('#divide').onclick = function() {
  document.getElementById("screen").innerHTML+= '/'
}

document.querySelector('#clear').onclick = function() {
  document.getElementById("screen").innerHTML= '';
}

document.querySelector('#result').onclick = function() {
  alert(calculate());
  document.getElementById("screen").innerHTML= '';
}

function calculate() {
	// body...
	var string = document.getElementById("screen").innerHTML;
	return eval(string)

}
