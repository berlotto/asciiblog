enviar = function(){
	//alert($('#conteudo').val());
};

var opts = {
  container: 'epiceditor',
  basePath: '/blog/static/epiceditor',
  clientSideStorage: true,
  localStorageName: 'berlottonetpost',
  parser: marked,
  file: {
    name: 'epiceditor',
    defaultContent: '',
    autoSave: 100
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

$('#title').live('keyup', function(){
	var cloneText = $(this).val().toLowerCase().split(/[ _]/).join('-').replace(/[^a-z0-9-]/g, '');
	$('#slug').val(cloneText);
});   

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