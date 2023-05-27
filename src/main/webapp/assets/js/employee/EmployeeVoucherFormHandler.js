/**
 * 
 */
function CloseForm() {
	//Close the form
	let addressPanel = document.getElementById('voucher-form-panel');
	addressPanel.classList.add('hidden');
}

function UpdateForm(idItem) {
	//Refresh

	//Set up the action for the form
	let idForm = 'voucher-form';
	var form = document.getElementById(idForm);
	form.setAttribute('action', `vouchers/update-voucher${idItem}.htm`);


	//Get all Data
	let nameVoucher = document.getElementById(`discountName${idItem}`).innerText;
	let postingDate = document.getElementById(`discountPosting${idItem}`).value;
	let expiryDate = document.getElementById(`itemExpiry${idItem}`).value;
	let detail = document.getElementById(`discountDetail${idItem}`).innerText;
	let discount = document.getElementById(`discountPercent${idItem}`).value;
	let status = document.getElementById(`discountStatus${idItem}`).value;
	console.log(`status is${status}`);
	console.log(`discount is${discount}`);
	//Parse to the form

	document.getElementById('inputNameDiscount').value = nameVoucher;
	document.getElementById('percentDiscount').value = discount;
	document.getElementById('displayPercent').value = parseFloat(discount) * 100;
	document.getElementById('statusDiscount').checked = status === "true";
	document.getElementById('inputDate').value = postingDate;
	document.getElementById('expiryDate').value = expiryDate;

	document.getElementById('inputDetail').value = detail;

	//Open the form
	let formPanel = document.getElementById('voucher-form-panel');
	formPanel.classList.remove('hidden');
}

function CreateForm() {
	//Set up the action for the form
	let idForm = 'voucher-form';
	var form = document.getElementById(idForm);
	form.setAttribute('action', 'vouchers/create-coupon.htm');

	//clear the id address(if have clicked updatebtn before)
	document.getElementById('inputNameDiscount').value = "";
	document.getElementById('statusDiscount').value = true;
	document.getElementById('inputDate').value = "";
	document.getElementById('expiryDate').value = "";
	//Open the form
	let addressPanel = document.getElementById('voucher-form-panel');
	addressPanel.classList.remove('hidden');
}