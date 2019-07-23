/* REALESTATE FUNCTIONS */

function addRealEstatesToSelect() {
    $.get("http://localhost/realestate/server/realestates.json", function (response) {
        response.forEach(function (e) {
            $('#realestate').append(new Option(e.option, e.value));
        });
        $('#realestate').change(function () { realEstateToggleOptions(); });
    });
}

function realEstateToggleOptions() {
    var value = $('#realestate').val();
    var opts = (value == "Maison" || value == "Appartement" ? "block" : "none");
    var optA = (value == "Appartement" ? "block" : "none");
    var optM = (value == "Maison" ? "block" : "none");
    var optL = (value == "Maison" ? "" : "none");
    var optR = (value == "Maison" || value == "Appartement" ? "" : "none");

    $('div[data-option="options"]').css("display", opts);
    $('div[data-option="optionsApartment"]').css("display", optA);
    $('div[data-option="optionsHouse"]').css("display", optM);
    $('div[data-search="land"]').css("display", optL);
    $('div[data-search="rooms"]').css("display", optR);
}


/* CITY FUNCTIONS */

/* function cityAutoCompletion(cityInput) {
    var val = cityInput.val();

    var url = "http://localhost/realestate/server/loadcities.php?q=" + val;

    $.get(url, function (response) {
        var cities = new Array();
        for (var element in response) {
            cities.push(response[element].name);
        }

        $('#city').autocomplete({ source: cities, minLength: 3, delay: 200 });
    });
}
 */

function cityAutoCompletion(cityInput) {
    cityInput.typeahead(
        {
            hint: true,
            highlight: true,
            minLength: 3,
            source: function (query, process) {
                var url = "http://localhost/realestate/server/loadcities.php?q=" + query;
                $.get(url, function (response) {
                    var cities = new Array();
                    for (var element in response) {
                        cities.push(response[element].name);
                    }
                    return process(cities);
                })

            },
        }
    );
}

function setHiddenIdCity(cityInput) {
    currentInput = cityInput.typeahead("getActive");
    var url = "http://localhost/realestate/server/loadcities.php?q=" + currentInput;
    $.get(url, function (response) {
        $('#cityid').val(response[0].id);
    });

}



/* USER_TYPE FUNCTIONS */

function addUserTypesToSelect() {
    $.get("http://localhost/realestate/server/usertypes.json", function (usertypes) {
        usertypes.forEach(function (e) {
            $('#user_type').append(new Option(e.option, e.value));
        });
        $('#user_type').change(function () { userTypeToggleModeratorName(); });
    });
}

function userTypeToggleModeratorName() {
    var moderatorName = ($('#user_type').val() == "M" ? "block" : "none");
    $('span#hidemoderator').css("display", moderatorName);
}


/* LOADING THE PAGE */


/* CITY AUTOCOMPLETION */

$(document).ready(function () {
    function cityInput() { cityAutoCompletion($('#city')) };
    $('#city').keyup(cityInput);
});

$(document).ready(function () {
    function changeInput() { setHiddenIdCity($('#city')) };
    $('#city').change(changeInput);
});


/* LOGIN */

/* $(document).ready(
    function () {
        $('form#login').submit(
            function (event) {
                $(this).validate();
                if ($(this).valid()) {
                    var jsonData = JSON.stringify({
                        "login": $('input[name="username"]').val(),
                        "password": $('input[name="password"]').val()
                    });

                    $.post(
                        "http://localhost/realestate/server/login.php",
                        jsonData,
                        function (result) { console.log(result); },
                        "json"
                    );
                    //event.preventDefault();
                    $('#notlogged').toggle();
                    $('#logged').toggle();
                }
            }
        );
    }
);
 */

$(document).ready(
    function () {
        $('form#login').submit(
            function () {
                $('#notlogged').toggle();
                $('#logged').toggle();
            }
        );
    }
);

/* CONTACT ADVERTISER */

$(document).ready(
    function () {
        $('form#contactAdvertiser').submit(
            function (event) {
                $(this).validate();
                if ($(this).valid()) {
                    console.log("Everything is super !");
                } else {
                    event.preventDefault();
                }
            }
        );
    }
);


$(document).ready(addRealEstatesToSelect);
$(document).ready(addUserTypesToSelect);
