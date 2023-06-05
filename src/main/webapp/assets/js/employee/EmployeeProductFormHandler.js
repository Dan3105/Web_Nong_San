function UpdateProduct(idItem) {
	//Refresh

	//Set up the action for the form
	let idForm = 'product-form';
	var form = document.getElementById(idForm);
	form.setAttribute('action', `employee/products/update-product${idItem}.htm`);

	//Get all Data
	let nameProduct = document.getElementById(`productName${idItem}`).value;
	let postingDate = document.getElementById(`postingDate${idItem}`).value;
	let categoryId = document.getElementById(`categoryId${idItem}`).value;
	let quantity = document.getElementById(`quantity${idItem}`).value;
	let detail = document.getElementById(`detail${idItem}`).value;
	let price = document.getElementById(`price${idItem}`).value;
	let discountId = document.getElementById(`discountId${idItem}`).value;
	let unit = document.getElementById(`unit${idItem}`).value;
	//Parse to the form

	document.getElementById('inputNameProduct').value = nameProduct;
	document.getElementById('inputCategory').value = categoryId;
	document.getElementById('inputQuantity').value = quantity;
	document.getElementById('inputUnit').value = unit;
	document.getElementById('inputDSId').value = discountId;
	document.getElementById('inputPrice').value = price;
	
	document.getElementById('inputDate').value = postingDate;
	document.getElementById('inputDetail').value = detail;

	//Open the form
	let formPanel = document.getElementById('product-form-panel');
	formPanel.classList.remove('hidden');
}

function CloseForm() {
	//Close the form
	let addressPanel = document.getElementById('product-form-panel');
	addressPanel.classList.add('hidden');
}

function CreateProduct() {
	//Set up the action for the form
	let idForm = 'product-form';
	var form = document.getElementById(idForm);
	form.setAttribute('action', 'employee/products/create-product.htm');

	//clear the id address(if have clicked updatebtn before)
	document.getElementById('inputCategory').selectedIndex = 0;
	document.getElementById('inputDSId').selectedIndex = 0;
	//Open the form
	let addressPanel = document.getElementById('product-form-panel');
	addressPanel.classList.remove('hidden');
}