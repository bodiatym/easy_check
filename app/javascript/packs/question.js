$(document).on('turbolinks:load', function () {
  $('select.form-select').on('change', function () {
      let selectElement = $(this);
      let selectValue = $(this).val();

      if ( selectValue === 'text' ) {
          $('#answer-fields').addClass('hidden');
      } else {
          $('#answer-fields').removeClass('hidden');
      }
  });
});

$(function () {
    $("#add-new-answer").click(function (e) {
        e.preventDefault();
        $("#dynamic-inputs").append($("#answer-input").html());
    });
});

$(function (){
    $("#remove-answer").click(function (e) {
        e.preventDefault();
        $("#dynamic-inputs").children().last().remove();
    });
});
