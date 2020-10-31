$(function() {
  $('.navigation').click(function() {
    var $answer = $(this).find('.show_head');
    if ($answer.hasClass('open')) {
      $answer.slideUp();
      $answer.removeClass('open');
    } else {
      $answer.slideDown();
      $answer.addClass('open');
    }
  });
});