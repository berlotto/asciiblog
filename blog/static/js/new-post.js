var editor = ace.edit("editor");
editor.setTheme("ace/theme/clouds");
editor.getSession().setMode("ace/mode/markdown");

$(document).ready(function(){
	$("#form-new-post").validate();
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

//============================================

$(function(){ // wait for document to load
  $('#postfile').MultiFile({
    list: '#postfile-list',
    accept: 'gif|jpg|png',
    max: 1,
    STRING: {
      remove:'<i class="icon-remove"></i>',
      selected:'Selecionado: $file',
      denied:'Utilize somente imagens para o banner do post!'
    }
  });
});
