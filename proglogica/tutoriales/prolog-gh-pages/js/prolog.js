window.onscroll = function() {scrollFunction()};

var mediaquery = window.matchMedia("(max-width: 64em)");
if (mediaquery.matches) {
	//alert("sdfsdf");
   var b = document.getElementById("myBtn").value = "Bebe";
   alert(b);
} else {
  // mediaquery no es 600
}

function scrollFunction() {
    if (document.body.scrollTop > 640 || document.documentElement.scrollTop > 640) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}


function topFunction() {
    document.body.scrollTop = 640; 
    document.documentElement.scrollTop = 640; 
}

