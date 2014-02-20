;(function ($, window, document, undefined) {

  jQuery(function () {

    // Programmatically hide buttons that are supposed to be hidden. This
    // ensures that the initial display state is correctly stored and applied
    // if the button is later shown.
    $('.Button.Hidden').removeClass('Hidden').hide();

    // Attach spinners using Spin.js to the .InProgress element in flyouts.
    $(document).on('click', '.ToggleFlyout', function (e) {
      var spinner = {
        lines  : 11
      , radius : 5
      , length : 5
      , width  : 2
      };

      $('.InProgress', e.currentTarget).spin(spinner);
    });

  });

})(jQuery, window, document);
