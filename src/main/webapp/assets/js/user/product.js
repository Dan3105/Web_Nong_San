const stars = document.querySelectorAll(".stars i");
const content = document.getElementById('content');
// Loop through the "stars" NodeList
stars.forEach((star, index1) => {

	star.addEventListener("click", () => {
		stars.forEach((star, index2) => {
			if (index1 >= index2) {
				star.classList.add("active")

			} else {
				star.classList.remove("active");

			}

		});
	});



});
function submit() {
	var count = 0;
	stars.forEach((star) => {
		if (star.classList.contains("active")) count++;

	});
	var url = window.location.href;
	url += "&rating="+count+"&content="+content.value;
	window.location.href = url;
	document.getElementById("resolution").value = count;

}


