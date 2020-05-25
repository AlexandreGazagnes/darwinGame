console.debug("front.js")

////////////////////////////////////////////////////////
//      FRONT.js
////////////////////////////////////////////////////////


//      Toogle various views
/////////////////////////////////////////////////////////

function updateFooterDim() {
    console.debug("updateFooterDim")
    $("#footerWidth").html(width);
    $("#footerHeight").html(height);

    let media = "xs";

    if (width > 576) {
        media = "sm";
    }

    if (width > 768) {
        media = "md";
    }
    if (width > 992) {
        media = "lg";
    }
    if (width > 1200) {
        media = "xl";
    }

    $("#footerMedia").html(media);
}

// info view
function loadLandingView() {
    console.debug("toogleLandingView");
    $("footer").hide();
    $("#" + initId).hide();
    $("#" + runId).hide();
    // $("#" + stateId).hide();
    // $("#" + actionId).hide();
    // $("#" + graphID).hide();
    $("#" + infoId).hide();
    $("#" + infoId).fadeIn(loadingSpeed);
    $("footer").fadeIn(loadingSpeed);
    updateFooterDim();
}

// init view
function fromLandingToInitView(option) {
    console.debug("fromLandingToInitView");
    initMethod = option;
    $("#" + infoId).fadeOut(transitionSpeed);
    $("#" + initId).delay(transitionSpeed - 1).fadeIn(transitionSpeed);
}

// back 0
function fromInitToLandingView() {
    console.debug("fromInitToLandingView");
    $("#" + initId).fadeOut(transitionSpeed);
    $("#" + infoId).delay(transitionSpeed - 1).fadeIn(transitionSpeed);
}

// from init to run
function fromInitToRunView() {
    console.debug("fromInitToRunView");
    // $("#" + infoId)..fadeOut(1500)();
    $("#" + initId).fadeOut(transitionSpeed);
    $("#" + runId).delay(transitionSpeed - 1).fadeIn(transitionSpeed);

    // $("#" + stateId).delay(transitionSpeed - 1).fadeIn(transitionSpeed);
    // $("#" + actionId).delay(transitionSpeed - 1).fadeIn(transitionSpeed);
    // $("#" + graphID).delay(transitionSpeed - 1).fadeIn(transitionSpeed);
}

// from init to run
function fromLandingToRunView() {
    console.debug("fromInitToRunView");
    // $("#" + infoId)..fadeOut(1500)();
    $("#" + infoId).fadeOut(transitionSpeed);
    $("#" + runId).delay(transitionSpeed - 1).fadeIn(transitionSpeed);

    // $("#" + stateId).delay(transitionSpeed - 1).fadeIn(transitionSpeed);
    // $("#" + actionId).delay(transitionSpeed - 1).fadeIn(transitionSpeed);
    // $("#" + graphID).delay(transitionSpeed - 1).fadeIn(transitionSpeed);
}

// back 1
function fromRunToInitView() {
    console.debug("fromRunToInitView");
    // $("#" + infoId)..slideUp(1500)();
    $("#" + stateId).fadeOut(transitionSpeed);
    $("#" + actionId).fadeOut(transitionSpeed);
    $("#" + graphID).fadeOut(transitionSpeed);
    $("#" + runId).delay(transitionSpeed - 1).fadeIn(transitionSpeed);

    $("#" + initId).delay(transitionSpeed - 1).fadeIn(transitionSpeed);

}


//      Dims, sm, grid management 
////////////////////////////////////////////

// dims
function updateDims() {
    console.debug("updateDims");
    width = $(document).width();
    height = $(document).height();
    console.debug(width, + " , " + height);
    updateFooterDim();
}

// sm or not 
function evalIsSmall() {
    console.debug("evalIsSmall");
    updateDims();
    if (width < 576) {
        isSmall = true;
    } else {
        isSmall = false;
    }
    console.debug("document is " + width + "small ? " + isSmall);
}

// order messup in 4*2 grids
function toogleFeatureGrid() {
    console.debug('toogleFeatureGrid')
    evalIsSmall();
    if (isSmall) {
        $("#featureColImg-1").removeClass("order-first");
        $("#featureColImg-3").removeClass("order-first");
    } else {
        $("#featureColImg-1").addClass("order-first");
        $("#featureColImg-3").addClass("order-first");
    }
}


// on load and reize
////////////////////////////////////////////

// load
function onFrontLoad() {
    console.debug("onFrontLoad");
    loadLandingView();
    toogleFeatureGrid();
}

// resize
function onFrontResize() {
    console.debug("onFrontResize");
    $(window).resize(function () {
        console.debug("reized");
        toogleFeatureGrid();
    });
}
