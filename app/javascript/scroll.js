if (document.URL.match( /messages/ )) {
  $(function(){
    $(".messages").scrollTop($("#message")[0].scrollHeight);
  });
};