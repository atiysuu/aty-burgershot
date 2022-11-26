$(function (){
    function display(bool){
        if(bool === true){
            $("#container").fadeIn();
        }else{
            $("#container").fadeOut();
        }
    }

    function displayForDrink(bool){
        if(bool === true){
            $("#container-2").fadeIn();
        }else{
            $("#container-2").fadeOut();
        }
    }

    display(false)
    displayForDrink(false)

    window.addEventListener("message", function(event){
        var item = event.data;
        if (item.type === "ui"){
            if (item.status == true){
                display(true)
            }
            else{
                display(false)
            }
        }
    })

    window.addEventListener("message", function(event){
        var item = event.data;
        if (item.type === "nui"){
            if (item.status == true){
                displayForDrink(true)
            }
            else{
                displayForDrink(false)
            }
        }
    })

    document.onkeyup = function (data){
        if (data.which == 27){
            $.post('https://aty_burgershot/exit', JSON.stringify ({}));
        }
    }

    let meatAmmount = 0;
    let meatPotato = 0;

    $(".ammount").html(meatAmmount);

    $(".ammount").html(meatPotato);

    $(document).on('click', "#moreMeat", function() {
        if (meatAmmount < 10){
            meatAmmount++
            console.log(meatAmmount)
            $("#ammountMeat").html(meatAmmount);
        }
    });

    $(document).on('click', "#lessMeat", function() {
        if (meatAmmount > 0){
            meatAmmount--
            console.log(meatAmmount)
            $("#ammountMeat").html(meatAmmount);
        }
    });

    $(document).on('click', "#morePotato", function() {
        if (meatPotato < 10){
            meatPotato++
            console.log(meatPotato)
            $("#ammountPotato").html(meatPotato);
        }
    });

    $(document).on('click', "#lessPotato", function() {
        if (meatPotato > 0){
            meatPotato--
            console.log(meatPotato)
            $("#ammountPotato").html(meatPotato);
        }
    });

    $(document).on('click', "#takeMeat", function() {	
        $("#takeMeat button div").addClass("active");
    });

    $(document).on('click', "#takePotato", function() {	
        $("#takePotato button div").addClass("active");
    });

    $("#close").click(function(){
        $.post('https://aty_burgershot/exit', JSON.stringify ({})); 
    })

    $("#closeMe").click(function(){
        $.post('https://aty_burgershot/exit', JSON.stringify ({})); 
    })

    $("#takeMeat").click(function(){
        $.post('https://aty_burgershot/getFrozenMeat', JSON.stringify ({})); 
    })

    $("#takePotato").click(function(){
        $.post('https://aty_burgershot/getFrozenPotato', JSON.stringify ({})); 
    })

    $("#getSprite").click(function(){
        $.post('https://aty_burgershot/giveSprite', JSON.stringify ({})); 
        $.post('https://aty_burgershot/exit', JSON.stringify ({})); 
    })

    $("#getCocaCola").click(function(){
        $.post('https://aty_burgershot/giveCola', JSON.stringify ({})); 
        $.post('https://aty_burgershot/exit', JSON.stringify ({})); 
    })

    $("#getPepsi").click(function(){
        $.post('https://aty_burgershot/givePepsi', JSON.stringify ({})); 
        $.post('https://aty_burgershot/exit', JSON.stringify ({})); 
    })

    $("#getWater").click(function(){
        $.post('https://aty_burgershot/giveWater', JSON.stringify ({})); 
        $.post('https://aty_burgershot/exit', JSON.stringify ({})); 
    })
})