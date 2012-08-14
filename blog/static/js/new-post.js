
var opts = {
  container: 'epiceditor',
  basePath: '/blog/static/epiceditor',
  clientSideStorage: true,
  localStorageName: 'berlottonetpost',
  parser: marked,
  file: {
    name: 'epiceditor',
    defaultContent: '',
    autoSave: false
  },
  theme: {
    base:'/themes/base/epiceditor.css',
    preview:'/themes/preview/github.css',
    editor:'/themes/editor/epic-dark.css'
  },
  focusOnLoad: false,
  shortcut: {
    modifier: 18,
    fullscreen: 70,
    preview: 80,
    edit: 79
  }
};

var epiceditor = new EpicEditor(opts).load();
epiceditor.on('update', function(){
	//Este codigo guarda no Hidden o conteudo do editor para ser enviado com o form corretamente.
	$('#conteudo').val( epiceditor.getElement('editor').body.innerHTML );
})

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
