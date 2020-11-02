$(document).on("turbolinks:load", (function() {
  $('.navigation').click(function() {
    var $answer = $(this).find('.ppp');
    if ($answer.hasClass('open')) {
      $answer.slideUp(500);
      $answer.removeClass('open');
    } else {
      $answer.slideDown();
      $answer.addClass('open');
    }
  });
}));