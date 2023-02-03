const reloj = document.querySelector('.clock')
function time() {
	const date = new Date()
	let hours = date.getHours();
	let minutes = date.getMinutes();
	let seconds = date.getSeconds();
  reloj.innerHTML = `${("0" + hours).slice(-2)}:${("0" + minutes).slice(-2)}:${("0" + seconds).slice(-2)}`
}
setInterval(time,1000);

document.addEventListener("DOMContentLoaded", function(){
	var alert = document.querySelector('.alert');
	if (alert){
		setTimeout(function(){
			alert.style.display = "none";
		}, 5000);
	}
});
