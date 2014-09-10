$(document).ready(function() {
  $("#ticket-num").on("submit", tix_search);
  $("#locker-size").on("submit", locker_search);
  $(".button").on("click", hideDiv);
  $(".print").on("click", printTicket);
});

function tix_search(e) {
  e.preventDefault();
  hideDiv();
  $.ajax({
    url: "/tickets",
    type: "GET",
    data: $("#ticket-num").serialize()
  }).done(updatePageTixSearchResults);
}

function locker_search(e) {
  e.preventDefault();
  hideDiv();
  $.ajax({
    url: "/sizes",
    type: "POST",
    data: $("#locker-size").serialize()
  }).done(updatePageLockerSearchResults);
}

function updatePageTixSearchResults(data){
  $("#ticket-num")[0].reset();
  data = JSON.parse(data);
  $(".display-info").removeClass("hidden");
  if (data.message === '') {
    $(".message").html("The items stored using ticket: <b>" + data.ticket_number + "</b><br>Are in locker number: <b>" + data.locker_number + "</b>");
  } else {
    $(".message").html(data.message);
  }
}

function updatePageLockerSearchResults(data){
  $("#locker-size")[0].reset();
  data = JSON.parse(data);
  $(".display-info").removeClass("hidden");
  if (data.message === '') {
    $(".message").html("You can store items in Locker: <b>" + data.locker_number + "</b><br>Your Ticket Number is: <b>" + data.ticket + "</b>");
    $(".print").html("Print Ticket");
    $(".print-ticket").html(data.ticket);
  } else {
    $(".message").html(data.message);
  }
}

function hideDiv(){
  $(".display-info").addClass("hidden");
  $(".message").html("");
  $(".print").html("");
}

function printTicket(){
  window.print();
}
