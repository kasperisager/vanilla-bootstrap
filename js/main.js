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

    var modal    = $()
      , backdrop = '.Overlay'
      , dialog   = '.Overlay > .Popup';

    $(document)
      .on('popupLoading', function (e) {
        $('body').addClass('modal-open');
        $(dialog).addClass('fade');
      })
      .on('popupReveal', function (e) {
        $(dialog).addClass('in');
      })
      .on('popupClose', function (e) {
        $(dialog).removeClass('in');
        setTimeout(function () { $('body').removeClass('modal-open'); }, 150);
        setTimeout(function () { $(backdrop).remove(); }, 300);
      });

    var modalPatch = [];
    modalPatch.push('li.Activity a.Delete');
    modalPatch.push('ul.Activities a.DeleteComment');

    // When only a confirmation modal is shown, the "popupLoading" and
    // "popupReveal" events are not triggered. Manually trigger them to make
    // sure that the modal is actually shown.
    $(document).on('click', modalPatch.join(','), function (e) {
      $('body').trigger('popupLoading');
      setTimeout(function () { $('body').trigger('popupReveal'); }, 150);

    });
  });

  $.popup.close = function (settings, response) {
    $(document).unbind('keydown.popup');
    $('#' + settings.popupId).trigger('popupClose');

    return false;
  };

})(jQuery, window, document);
