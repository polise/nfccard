//This instantiates a function you may use several times.

jQuery.fn.submitWithAjax = function() {
  this.live("click", function() {
    $.ajax({type: "GET", url: $(this).attr("href"), dataType: "script"});
    return false;
  });
};

// Here's an example of the class that will be 'clicked'
$(".getGeoLocation").submitWithAjax();