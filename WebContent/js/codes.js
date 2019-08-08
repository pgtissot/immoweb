/* AD CLICK */

$(document).ready(function() {
	$('a[role="button"]').each(function() {
		var id = $(this).attr("id");
		var formName = "form#"+id;
		$(this).click(function () {
			$(formName).submit();
		})
	});
});


/* INDEX LINKS */

$(document).ready(function() {
	$('a[id^="quick-link"]').each(function() {
		var re = $(this).attr("id");
		var formName = "form#"+re;
		$(this).click(function () {
			$(formName).submit();
		})
	});
});




/*LOGIN /REGISTER TOGGLE */



$(document).ready(function(){
	$("#loginLink").click(function() {
		$("#loginLink").addClass("active");
		$("#registerLink").removeClass("active");
		$("#registrationForm").hide();
		$("#loginForm").show();
	});
	
});

$(document).ready(function(){

	$("#registerLink").click(function() {
		$("#loginLink").removeClass("active");
		$("#registerLink").addClass("active");
		$("#loginForm").hide();
		$("#registrationForm").show();
	});
	});



/* FUNCTION MONTRE PASS */

$(document).ready(function() {
	$('form input[type="password"]').prev().click(function() {
		typ = $(this).next().attr('type');
		if (typ == 'password') {
			$(this).next().attr('type', 'text');
			$(this).removeClass('fa-eye');
			$(this).addClass('fa-eye-slash');
		} else {
			$(this).next().attr('type', 'password');
			$(this).addClass('fa-eye');
			$(this).removeClass('fa-eye-slash');
		}
	});
});

$(document).ready(function() {
	$('.mpass').click(function() {
		typ = $('form input[name="password"]').attr('type');
		if (typ == 'password') {
			$('form input[name="password"]').attr('type', 'text');
			$('.mpass').removeClass('fa-eye');
			$('.mpass').addClass('fa-eye-slash');
		} else {
			$('form input[name="password"]').attr('type', 'password');
			$('.mpass').addClass('fa-eye');
			$('.mpass').removeClass('fa-eye-slash');
		}
	});
});






/* REALESTATE FUNCTIONS */

function addRealEstatesToSelect() {
	$.get("http://localhost:8080/ImmoWeb/server/realestates.json", function(
			response) {
		response.forEach(function(e) {
			$('#realestate').append(new Option(e.option, e.value));
		});
		$('#realestate').change(function() {
			realEstateToggleOptions();
		});
	});

	var presetRealEstate = $('#oldre').val();
	setTimeout(function () {
		$('#realestate option[value="'+presetRealEstate+'"]').prop('selected', true);
	}, 10);
	setTimeout(function () {
		realEstateToggleOptions();
	}, 10);

}

function realEstateToggleOptions() {
	var value = $('#realestate').val();
	var opts = (value == "House" || value == "Apartment" ? "block" : "none");
	var optA = (value == "Apartment" ? "block" : "none");
	var optM = (value == "House" ? "block" : "none");
	var optL = (value == "House" ? "" : "none");
	var optF = (value == "Apartment" ? "block" : "none");
	var optR = (value == "House" || value == "Apartment" ? "" : "none");

	$('div[data-option="options"]').css("display", opts);
	$('div[data-option="optionsApartment"]').css("display", optA);
	$('div[data-option="optionsHouse"]').css("display", optM);
	$('div[data-search="land"]').css("display", optL);
	$('div[data-search="rooms"]').css("display", optR);
	$('div[data-search="floor"]').css("display", optF);
}

$(document).ready(addRealEstatesToSelect);


/* ENERGY OPTIONS */

var levels = [ "a", "b", "c", "d", "e", "f", "g" ];

function energyOptionToggle() {
	levels.forEach(function(e) {
		$('#energy-level').removeClass("energy-" + e);
		$('#energy-level:focus').removeClass("energy-" + e);
	});
	var value = $('#energy-level').val().toLowerCase();
	console.log('In toggle : '+$('#energy-level').val());
	if (typeof value != "undefined") {
		$('#energy-level').addClass("energy-" + value);
		$('#energy-level:focus').addClass("energy-" + value);
	}
}

function gasOptionToggle() {
	levels.forEach(function(e) {
		$('#gas-level').removeClass("gas-" + e);
		$('#gas-level:focus').removeClass("gas-" + e);
	});
	var value = $('#gas-level').val().toLowerCase();
	console.log('In toggle : '+$('#gas-level').val());
	if (typeof value != "undefined") {
			$('#gas-level').addClass("gas-" + value);
			$('#gas-level:focus').addClass("gas-" + value);
	}
}


function presetEnergyOptions() {
	var presetEnergy = $('#oldenergy').val();
	var presetGas = $('#oldgas').val();

	setTimeout(function () {
		$('#energy-level option[value="'+presetEnergy+'"]').prop('selected', true);
		$('#gas-level option[value="'+presetGas+'"]').prop('selected', true);
	}, 10);
	setTimeout(function () {
		energyOptionToggle();
		gasOptionToggle();
	}, 10);
}

$(document).ready(presetEnergyOptions);

$(document).ready(function() {
	function changeEnergy() {
		energyOptionToggle()
	};
	function changeGas() {
		gasOptionToggle()
	};
	$('#energy-level').change(changeEnergy);
	$('#gas-level').change(changeGas);
});




/* CITY FUNCTIONS */

/*
 * function cityAutoCompletion(cityInput) { var val = cityInput.val();
 * 
 * var url = "http://localhost/realestate/server/loadcities.php?q=" + val;
 * 
 * $.get(url, function (response) { var cities = new Array(); for (var element
 * in response) { cities.push(response[element].name); }
 * 
 * $('#city').autocomplete({ source: cities, minLength: 3, delay: 200 }); }); }
 */

function cityAutoCompletion(cityInput) {
	cityInput.typeahead({
		hint : true,
		highlight : true,
		minLength : 3,
		source : function(query, process) {
			var url = "http://localhost:8080/ImmoWeb/CityServlet?input="
					+ query;

			$.get(url, function(response) {
				var completions = JSON.parse(response);
				var cities = new Array();
				completions.forEach(function(e) {
					cities.push(e);
				});
				return process(cities);
			})

		},
	});
}

function setHiddenIdCity(cityInput) {
	currentInput = cityInput.typeahead("getActive");
	var url = "http://localhost:8080/ImmoWeb/CityServlet?input="
			+ encodeURI(currentInput.name) + "&exact=1";
	console.log(url);
	$.get(url, function(response) {
		console.log(response);
		var completions = JSON.parse(response);
		$('#cityId').val(completions[0].id);
	});

}

$(document).ready(function() {
	function cityInput() {
		cityAutoCompletion($('#city'))
	}
	;
	$('#city').keyup(cityInput);
});

$(document).ready(function() {
	function changeInput() {
		setHiddenIdCity($('#city'))
	}
	;
	$('#city').change(changeInput);
});


/* USER_TYPE FUNCTIONS */

function addUserTypesToSelect() {
	$.get("http://localhost:8080/ImmoWeb/server/usertypes.json", function(
			usertypes) {
		usertypes.forEach(function(e) {
			$('#user_type').append(new Option(e.option, e.value));
		});
		$('#user_type').change(function() {
			userTypeToggleModeratorName();
		});
	});
}

function userTypeToggleModeratorName() {
	var moderatorName = ($('#user_type').val() == "M" ? "block" : "none");
	$('span#hidemoderator').css("display", moderatorName);
}

$(document).ready(addUserTypesToSelect);

/* LOADING THE PAGE */

/* LOGIN */

/*
 * $(document).ready( function () { $('form#login').submit( function (event) {
 * $(this).validate(); if ($(this).valid()) { var jsonData = JSON.stringify({
 * "login": $('input[name="username"]').val(), "password":
 * $('input[name="password"]').val() });
 * 
 * $.post( "http://localhost/realestate/server/login.php", jsonData, function
 * (result) { console.log(result); }, "json" ); //event.preventDefault();
 * $('#notlogged').toggle(); $('#logged').toggle(); } } ); } );
 */

$(document).ready(function() {
	$('form#login').submit(function() {
		$('#notlogged').toggle();
		$('#logged').toggle();
	});
});

/* CONTACT ADVERTISER */

$(document).ready(function() {
	$('form#contactAdvertiser').submit(function(event) {
		$(this).validate();
		if ($(this).valid()) {
			console.log("Everything is super !");
		} else {
			event.preventDefault();
		}
	});
});

