var editor = ace.edit("editor");
editor.setTheme("ace/theme/clouds");
editor.getSession().setMode("ace/mode/markdown");
editor.on('change', function(){
  //this is to send content of the Markdown editor to POST
  $('#content').val(editor.getSession().toString());
})


showProcessing = function(){
  $.blockUI({ message: '<h3><img src="/static/img/loading.gif" /><br>Salvando os dados...</h3>' });
}

processReturn = function(data){
  $('#retorno').addClass('alert'); //
  $('#retorno').html(data.message); //Mosta a mensagem de retorno com estilo
  $('#form-new-post').append('<input type="hidden" value="'+data.id+'">'); //Adiciona o hidden com o ID do novo post já salvo
  $('#acao').html('Editar post:'); //Troca o label
  $.unblockUI();
}

$(document).ready(function(){
	$("#form-new-post").validate();

  options = {
    //target:        '#retorno',   // target element(s) to be updated with server response 
    beforeSubmit:  showProcessing,  // pre-submit callback 
    success:       processReturn,
    dataType:      'json',
  }
  $('#form-new-page').ajaxForm(options);
});


//============================================ PARA AS CHAMADAS DE CRIACAO DO SLUG

//setup call for slug at and of typing ( http://narf.pl/jquery-typing/ )
$('#title').typing({
    start: function (event, $elem) {
        //$elem.css('background', '#fa0');
    },
    stop: function (event, $elem) {
      $.getJSON('/slugfy',{text: $('#title').val()}, function(data){
          $('#slug').val( data.slug )
        }
      );
    },
    delay: 1000
});
