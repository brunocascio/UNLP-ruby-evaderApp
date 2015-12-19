jQuery(function($){

  $(document).on('click', '.toggler', function(e){
    e.preventDefault();
    e.stopPropagation();

    var dataHide = $(this).data('hide');
    var dataShow = $(this).data('show');

    if ( dataHide ) {
      $(dataHide).toggleClass('hidden');
    }

    if ( dataShow ) {
      $(dataShow).toggleClass('hidden');
    }

    if ( $(this).text().toLowerCase() == 'contactar' ) {
       $(this).text('Cerrar');
    } else {
       $(this).text('Contactar');
    }
  });

});
