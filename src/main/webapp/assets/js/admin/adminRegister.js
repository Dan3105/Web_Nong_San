/**
 * 
 */

function lazyLoading() {
	const dataDistrict = 'data-district';
	const dataProvince = 'data-province'

	var provinceSelect = document.getElementById('province');
	var districtSelect = document.getElementById('district');
	var wardSelect = document.getElementById('ward');

	var districts = Array.from(districtSelect.options).map(function(option) {
		return {
			id: option.value,
			name: option.text,
			provinceId: option.dataset.province
		};
	});

	var wards = Array.from(wardSelect.options).map(function(option) {
		return {
			id: option.value,
			name: option.text,
			districtId: option.dataset.district
		};
	});

	provinceSelect.addEventListener('change', function() {
		//Get ID Province
		let selectedProvince = provinceSelect.value;

		//Reset length for everything
		districtSelect.options.length = 1;
		wardSelect.options.length = 1;
		FilterDistrictBasedProvince(selectedProvince, districts);
	});

	districtSelect.addEventListener('change', function() {
		//Get ID Province
		let selectedDistrict = districtSelect.value;

		//Reset length for everything
		wardSelect.options.length = 1;
		FilterWardBasedDistrict(selectedDistrict, wards);
	})



	/*
	@param(selectedProvince) string id
	*/
	function FilterDistrictBasedProvince(selectedProvince) {
		districts.filter(function(district) {
			return district.provinceId === selectedProvince;
		}).forEach(function(district) {
			var option = document.createElement('option');
			option.value = district.id;
			option.text = district.name;
			districtSelect.appendChild(option);
		});
	}

	/*
	@param(selectedDistrict) string id
	*/
	function FilterWardBasedDistrict(selectedDistrict) {
		wards.filter(function(ward) {
			return ward.districtId === selectedDistrict;
		}).forEach(function(ward) {
			var option = document.createElement('option');
			option.value = ward.id;
			option.text = ward.name;
			wardSelect.appendChild(option);
		});
	}
}
