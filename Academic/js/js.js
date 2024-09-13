/// <reference path="bootstrap.min.js" />
function clickhere() {
    document.getElementById("body").style.marginRight = "0";
    document.getElementById("show3").style.display = "none";
    document.getElementById("navbar").style.marginRight = "0";
    document.getElementById("move").style.display = "none";
    document.getElementById("movehide").style.display = "initial";
}
function clickDisplay() {
    document.getElementById("body").style.marginRight = "220px";
    document.getElementById("show3").style.display = "block";
    document.getElementById("navbar").style.marginRight = "220px";
    document.getElementById("move").style.display = "initial";
    document.getElementById("movehide").style.display = "none";
}