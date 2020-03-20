$(function(){
  $(document).on("turbolinks:load", function(){
    $("input.toggle").on("change", function(){
      $(this).parents("form").trigger("submit")
    })
  })

});
