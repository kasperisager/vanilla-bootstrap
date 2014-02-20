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

    var $backdrop = $('<div class="modal-backdrop fade in"></div>');

    $(document)
      .on('popupLoading', function (e) {
        $('body').addClass('modal-open');
        $('.Overlay > .Popup').addClass('fade');
      })
      .on('popupReveal', function (e) {
        $('.Overlay > .Popup').addClass('in');
      })
      .on('popupClose', function (e) {
        $('.Overlay > .Popup').removeClass('in');

        setTimeout(function () {
          $('body').removeClass('modal-open');

          setTimeout(function () {
            $('.Overlay').remove();
          }, 150);
        }, 150);
      });
  });

  $.popup.close = function (settings, response) {
    $(document).unbind('keydown.popup');
    $('#' + settings.popupId).trigger('popupClose');

    return false;
  };

})(jQuery, window, document);
