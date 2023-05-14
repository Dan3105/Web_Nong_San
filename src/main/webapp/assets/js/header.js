$('.owl-carousel').owlCarousel({
	loop: true,
	margin: 10,
	dots: false,
	responsiveClass: true,
	responsive: {
		0: {
			items: 4,
			nav: true
		},
		600: {
			items: 5,
			nav: true
		},
		1000: {
			items: 7,
			nav: true,

		}
	}
})

var myAlert = document.getElementById('alert-btn')
var bsAlert = new bootstrap.Alert(myAlert)

const toastTrigger = document.querySelectorAll('.liveToastBtn')
const toastLiveExample = document.getElementById('liveToast')


toastTrigger.forEach((element) => {

	element.onclick = function() {
		element.addEventListener('click', () => {
			const toast = new bootstrap.Toast(toastLiveExample);
			toast.show();
		})


	}
});