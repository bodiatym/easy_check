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
