$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("#question-votes").on("click", "#question-up", function(event){
    event.preventDefault();
    var url = $(this).attr("href");
    $.ajax({
      url: url,
      method: "POST"
    }).done(function(response){
      location.reload();
    })
  })

  $("#question-votes").on("click", "#question-down", function(event){
    event.preventDefault();
    var url = $(this).attr("href");
    $.ajax({
      url: url,
      method: "POST"
    }).done(function(response){
      location.reload();
    })
  })

  $("#answer-votes").on("click", "#answer-up", function(event){
    event.preventDefault();
    var url = $(this).attr("href");
    $.ajax({
      url: url,
      method: "POST"
    }).done(function(response){
      location.reload();
    })
  })

  $("#answer-votes").on("click", "#answer-down", function(event){
    event.preventDefault();
    var url = $(this).attr("href");
    $.ajax({
      url: url,
      method: "POST"
    }).done(function(response){
      location.reload();
    })
  })
});
