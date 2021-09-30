$(document).ready(function () {
  HealthIndicator = new ProgressBar.Circle("#HealthIndicator", {
    color: "rgb(0, 182, 91)",
    trailColor: "rgba(0, 182, 91, 0.4)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  ArmorIndicator = new ProgressBar.Circle("#ArmorIndicator", {
    color: "rgb(0, 140, 255)",
    trailColor: "rgba(0, 140, 255, 0.4)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  HungerIndicator = new ProgressBar.Circle("#HungerIndicator", {
    color: "rgb(255, 164, 59)",
    trailColor: "rgba(255, 164, 59, 0.4)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  ThirstIndicator = new ProgressBar.Circle("#ThirstIndicator", {
    color: "rgb(0, 140, 255)",
    trailColor: "rgba(0, 140, 255, 0.4)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  /*BloodIndicator = new ProgressBar.Circle("#BloodIndicator", {
    color: "rgb(255, 0, 0)",
    trailColor: "rgba(0, 0, 0, 0.0)",
    strokeWidth: 15,
    trailWidth: 6,
    duration: 250,
    easing: "easeInOut",
  });*/

  StressIndicator = new ProgressBar.Circle("#StressIndicator", {
    color: "rgb(255, 101, 74)",
    trailColor: "rgba(255, 101, 74, 0.2)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  OxygenIndicator = new ProgressBar.Circle("#OxygenIndicator", {
    color: "rgb(214, 101, 93)",
    trailColor: "rgba(214, 101, 93, 0.4)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  Speedometer = new ProgressBar.Circle("#SpeedCircle", {
    color: "rgba(70, 104, 135, 1)",
    trailColor: "rgba(0, 0, 0, 0.0)",
    strokeWidth: 10,
    duration: 100,
    trailWidth: 6,
    easing: "easeInOut",
  });

  FuelIndicator = new ProgressBar.Circle("#FuelCircle", { 
    color: "rgba(255, 255, 255,)",
    trailColor: "rgba(255, 255, 255, 0.4)",
    strokeWidth: 10,
    duration: 2000,
    trailWidth: 10,
    easing: "easeInOut",
  });

  NitrousIndicator = new ProgressBar.Circle("#NitrousCircle", { 
    color: "rgba(157, 0, 255)",
    trailColor: "rgba(157, 0, 255, 0.4)",
    strokeWidth: 15,
    duration: 2000,
    trailWidth: 15,
    easing: "easeInOut",
  });

  BeltIndicator = new ProgressBar.Circle("#BeltCircle", { 
    color: "rgba(255, 0, 0)",
    trailColor: "rgba(255, 0, 0, 0.4)",
    strokeWidth: 15,
    duration: 2000,
    trailWidth: 15,
    easing: "easeInOut",
  });

  /*CruiseIndicator = new ProgressBar.Circle("#CruiseCircle", { 
    color: "rgba(70, 104, 135, 1)",
    trailColor: "rgba(0, 0, 0, 0.0)",
    strokeWidth: 10,
    duration: 2000,
    trailWidth: 6,
    easing: "easeInOut",
  });*/

  VoiceIndicator = new ProgressBar.Circle("#VoiceIndicator", {
    color: "#4a4a4a",
    trailColor: "rgba(255, 255, 255, 0.4)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });
  VoiceIndicator.animate(0.66);
});

window.addEventListener("message", function (event) {
  let data = event.data;

  if (data.action == "update_hud") {
    HealthIndicator.animate(data.hp / 100);
    ArmorIndicator.animate(data.armor / 100);
    HungerIndicator.animate(data.hunger / 100);
    ThirstIndicator.animate(data.thirst / 100);
    /*BloodIndicator.animate(data.bleedingPercentage / 100);*/
    StressIndicator.animate(data.stress / 100);
    OxygenIndicator.animate(data.oxygen / 100);
  }

  // Get current voice level and animate path
  if (data.action == "voice_level") {
    switch (data.voicelevel) {
      case 1.0:
        data.voicelevel = 33;
        break;
      case 2.3:
        data.voicelevel = 66;
        break;
      case 5.0:
        data.voicelevel = 100;
        break;
      default:
        data.voicelevel = 66;
        break;
    }
    VoiceIndicator.animate(data.voicelevel / 100);
  }

  // Light up path if talking
  if (data.talking == 1) {
    VoiceIndicator.path.setAttribute("stroke", "yellow");
  } else if (data.talking == false) {
    VoiceIndicator.path.setAttribute("stroke", "white");
  }

  // Headset icon if using radio
  if (data.radio == true) {
    $("#VoiceIcon").removeClass("fa-headset");
    $("#VoiceIcon").addClass("fa-microphone");
  } else if (data.radio == false) {
    $("#VoiceIcon").removeClass("fa-microphone");
    $("#VoiceIcon").addClass("fa-headset");
  }

  // Hide stress if disabled
  if (data.action == "disable_stress") {
    $("#StressIndicator").hide();
  }

  // Hide voice if disabled
  if (data.action == "disable_voice") {
    $("#VoiceIndicator").hide();
  }

  // Show oxygen if underwater
  if (data.showOxygen == true) {
    $("#OxygenIndicator").show();
  } else if (data.showOxygen == false) {
    $("#OxygenIndicator").hide();
  }

  // Hide armor if 0
  if (data.armor == 0) {
    $("#ArmorIndicator").fadeOut();
  } else if (data.armor > 0) {
    $("#ArmorIndicator").fadeIn();
  }

  if (data.stress == 0) {
    $("#StressIndicator").fadeOut();
  } else if (data.stress > 0) {
    $("#StressIndicator").fadeIn();
  }

  if (data.bleedingPercentage == 0) {
    $("#BloodIndicator").fadeOut();
  } else if (data.bleedingPercentage > 0) {
    $("#BloodIndicator").fadeIn();
  }

  // Change color and icon if HP is 0 (dead)
  if (data.hp < 0) {
    HealthIndicator.animate(0);
    HealthIndicator.trail.setAttribute("stroke", "rgb(0, 182, 91, 0.4)");
    $("#hp-icon").removeClass("fa-heart");
    $("#hp-icon").addClass("fa-skull");
  } else if (data.hp > 0) {
    HealthIndicator.trail.setAttribute("stroke", "rgb(0, 182, 91, 0.4)");
    $("#hp-icon").removeClass("fa-skull");
    $("#hp-icon").addClass("fa-heart");
  }

  // Flash if thirst is low
  if (data.thirst < 25) {
    $("#ThirstIndicator").toggleClass("flash");
  }
  // Flash if hunger is low
  if (data.hunger < 25) {
    $("#HungerIndicator").toggleClass("flash");
  }
  // Flash if blood is high
  if (data.bleedingPercentage > 75) {
    $("#BloodIcon").toggleClass("flash");
  }
  // Flash if Oxygen is low
  if (data.oxygen < 25) {
    $("#OxygenIndicator").toggleClass("flash");
  }
  // Flash if health is low
  if (data.hp < 25) {
    $("#HealthIndicator").toggleClass("flash");
  }
  // Flash if stress is high
  if (data.stress > 75) {
    $("#StressIndicator").toggleClass("flash");
  }

  if (data.rpm > 0) {
    $("#SpeedIndicator").text(data.speed);
    let SpeedoLimit = data.maxspeed;
    var rpm = data.rpm;

    if (rpm > SpeedoLimit) {
      rpm = SpeedoLimit;
    }

    Speedometer.animate(rpm / SpeedoLimit);
      Speedometer.path.setAttribute("stroke", "green");
    if (data.rpm > 95) {
      Speedometer.path.setAttribute("stroke", "red");
    } else if (data.rpm > 85) {
      Speedometer.path.setAttribute("stroke", "yellow");
    } else if (data.rpm == 0) {
      $("#SpeedIndicator").text("0");
      Speedometer.path.setAttribute("stroke", "none");
    }
  }


  if (data.action == "update_fuel") {
    let fuel = data.fuel;
    if (fuel > 97) {
      FuelIndicator.animate(100 / 100);
    } else if (fuel < 97) {
      FuelIndicator.animate(fuel / 100);
    }
    if (fuel < 17) {
      FuelIndicator.path.setAttribute("stroke", "red");
      $("#FuelCircle").toggleClass("flash");
    } else if (fuel > 17) {
      FuelIndicator.path.setAttribute("stroke", "white");
    }
  }

  if (data.action == "update_nitrous") {
    if (data.nitrous > 0) {
      $("#NitrousCircle").fadeIn();
      NitrousIndicator.animate(data.nitrous / 100);
    }
    else {
      $("#NitrousCircle").fadeOut();
      NitrousIndicator.animate(0);
    } if (data.nitrous < 20) {
      NitrousIndicator.path.setAttribute("stroke", "#9c50cc");
      $("#NitrousCircle").toggleClass("flash");
    } else {
      NitrousIndicator.path.setAttribute("stroke", "#9c50cc");
    }
  }

  if (data.showSpeedo == true) {
    $("#VehicleContainer").fadeIn();
  } else if (data.showSpeedo == false) {
    $("#VehicleContainer").fadeOut();
  }

  if (data.showFuel == true) {
    $("#FuelCircle").show();
  } else if (data.showFuel == false) {
    $("#FuelCircle").hide();
  }

  if (data.hunger == 100) {
    $("#HungerIndicator").fadeOut();
  } else if (data.hunger < 80) {
    $("#HungerIndicator").fadeIn();
  }

  if (data.thirst == 100) {
    $("#ThirstIndicator").fadeOut();
  } else if (data.thirst < 100) {
    $("#ThirstIndicator").fadeIn();
  }

  if (data.showNitrous == true) {
    $("#NitrousCircle").show();
  } else if (data.showNitrous == false) {
    $("#NitrousCircle").hide();
  }

  if (data.seatbelt == false) {
    $("#BeltCircle").show();
    BeltIndicator.trail.setAttribute("stroke", "red");
  } else if (data.seatbelt == true) {
    $("#BeltCircle").show();
    BeltIndicator.trail.setAttribute("stroke", "#5feb46");
  }
  if (data.seatbelt === 0) {
    $("#BeltCircle").hide();
  }

  /*if (data.showCruise == true) {
    $("#CruiseIcon").css("color", "red");
    CruiseIndicator.trail.setAttribute("stroke", "transparant");
  } else if (data.showCruise == false) {
    $("#CruiseIcon").css("color", "#5feb46");
  }*/

  if (data.showUi == true) {
    $(".container").show();
  } else if (data.showUi == false) {
    $(".container").hide();
  }

  if (data.action == "toggle_hud") {
    $("body").fadeToggle()
  }
});
