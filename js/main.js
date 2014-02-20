;(function ($, window, document, undefined) {

  jQuery(function () {

    // Programmatically hide buttons that are supposed to be hidden. This
    // ensures that the initial display state is correctly stored and applied
    // if the button is later showed.
    $('.Button.Hidden').removeClass('Hidden').hide();

  });

})(jQuery, window, document);
