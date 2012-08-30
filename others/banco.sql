BEGIN TRANSACTION;
CREATE TABLE comment (
	id INTEGER NOT NULL, 
	content VARCHAR(2000), 
	date_created DATETIME, 
	reply_for INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(reply_for) REFERENCES comment (id)
);
CREATE TABLE "like" (
	id INTEGER NOT NULL, 
	comment INTEGER, 
	post INTEGER, 
	link INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(comment) REFERENCES comment (id), 
	FOREIGN KEY(post) REFERENCES post (id), 
	FOREIGN KEY(link) REFERENCES link (id)
);
CREATE TABLE link (
	id INTEGER NOT NULL, 
	name VARCHAR(100), 
	url VARCHAR(1000), 
	PRIMARY KEY (id)
);
CREATE TABLE post (
	id INTEGER NOT NULL, 
	title VARCHAR(150), 
	slug VARCHAR(500), 
	resume VARCHAR(1000), 
	content TEXT, 
	date_created DATETIME, 
	date_updated DATETIME, 
	picture VARCHAR(200), 
	featured VARCHAR(1), tags varchar(500) null, 
	PRIMARY KEY (id), 
	UNIQUE (slug)
);
CREATE TABLE page (date_updated DATETIME, date_created DATETIME, id INTEGER PRIMARY KEY, title VARCHAR2(150), slug VARCHAR2(500), content TEXT);
INSERT INTO page VALUES('2012-08-22 23:18:58.055789','2012-08-22 23:18:58.055653',1,'Pagina Nova','pagina1','**Testando**');
INSERT INTO page VALUES('2012-08-22 23:40:25.589889','2012-08-22 23:40:25.589808',2,'Utilizando o Arch Linux no Desktop','livro','Depois de um tempo utilizando o ArchLinux para meu divertimento e trabalho em casa, aprendi bastante sobre ele. Tenho participado do fórum, da lista de discução ( apesar de menos que no fórum ), tenho conversado com o pessoal pelo twitter, msn, email, etc e 

E depois de ler vários e vários tutoriais e posts pela internet inteira, acabei achando interessante juntar todas as informações necessárias para se ter um ambiente de trabalho funcional utilizando esta ótima distro, que me agradou desde que conheci !

Nasceu então **Utilizando o Arch Linux no Desktop** !


<a href="/leia"><img class="thumb" src="/static/img/livro.png" height="500px"/></a>


Se você for ver, ele é um livro meio guia de usuário! Nele você encontra várias informações sobre a história do Arch, seu funcionamento, instalação, configuraç...

Eu estou aprendendo a escrever um livro ainda, portando ele pode mudar bastante, principalmente o formato, ao longo do tempo do seu desenvolvimento.

Eu me incentivei a escrever este livro depois de ler o ótimo trabalho feito pelo Luiz Eduardo Borges, com o seu livro open-source "Python para Desenvolvedores", onde ele apresenta a linguagem Python focado em quem já programa.

O livro é open-source, licenciado por <i>"Creative Atribuição-Compartilhamento pela mesma Licença 3.0 Brasil Commons</i>"</p>

<img class="thumb" src="/static/img/cc.png"/>

A última versão, em PDF está disponível pelo wiki do repositório do projeto <a 
href="http://hg.berlotto.blog.br/archlinux-book/wiki/Home">http://hg.berlotto.blog.br/archlinux-book/wiki/Home</a>, e caso queiram o source do livro, é só pegar lá também.


Baixe o Livro ! Leia-o ! Imprima-o ! Divulgue-o ! Este será o seu "pagamento" ao meu trabalho: reconhecimento !

Valew pessoALL !');
INSERT INTO page VALUES('2012-08-22 23:54:21.205047','2012-08-22 23:54:21.204942',3,'Fotos','fotos','Estas são as fotos que tenho e tal...');
INSERT INTO page VALUES('2012-08-23 12:36:46.998648','2012-08-23 12:36:46.998486',4,'Contatos','contatos','Veja aqui as informações sobre como me encontrar através da internet.

Sites e blogs:

- Facebook
- Twitter
- Google Code
- Bitbucket
- Github
- Wordpress.com
 
Emails:

- sergio.berlotto@gmail.com
- sergio@berlotto.net
- sergio-berlotto@gg.rs.gov.br

');
INSERT INTO page VALUES('2012-08-23 13:24:06.841607','2012-08-23 13:24:06.841537',5,'Projetos','projetos','Estes são os projetos nos quais eu já trabalhei ou estou trabalhando.

- Upvideos
- Gabinete Digital
- asciiblog
');
INSERT INTO page VALUES('2012-08-24 00:15:50.675536','2012-08-24 00:15:50.675441',6,'Markdown Syntax - Help','help-edit','<h3>Phrase Emphasis</h3>

<pre><code>*italic*   **bold**
_italic_   __bold__
</code></pre>

<h3>Links</h3>

<p>Inline:</p>

<pre><code>An [example](http://url.com/ "Title")
</code></pre>

<p>Reference-style labels (titles are optional):</p>

<pre><code>An [example][id]. Then, anywhere
else in the doc, define the link:

  [id]: http://example.com/  "Title"
</code></pre>

<h3>Images</h3>

<p>Inline (titles are optional):</p>

<pre><code>![alt text](/path/img.jpg "Title")
</code></pre>

<p>Reference-style:</p>

<pre><code>![alt text][id]

[id]: /url/to/img.jpg "Title"
</code></pre>

<h3>Headers</h3>

<p>Setext-style:</p>

<pre><code>Header 1
========

Header 2
--------
</code></pre>

<p>atx-style (closing #''s are optional):</p>

<pre><code># Header 1 #

## Header 2 ##

###### Header 6
</code></pre>

<h3>Lists</h3>

<p>Ordered, without paragraphs:</p>

<pre><code>1.  Foo
2.  Bar
</code></pre>

<p>Unordered, with paragraphs:</p>

<pre><code>*   A list item.

    With multiple paragraphs.

*   Bar
</code></pre>

<p>You can nest them:</p>

<pre><code>*   Abacus
    * answer
*   Bubbles
    1.  bunk
    2.  bupkis
        * BELITTLER
    3. burper
*   Cunning
</code></pre>

<h3>Blockquotes</h3>

<pre><code>&gt; Email-style angle brackets
&gt; are used for blockquotes.

&gt; &gt; And, they can be nested.

&gt; #### Headers in blockquotes
&gt; 
&gt; * You can quote a list.
&gt; * Etc.
</code></pre>

<h3>Code Spans</h3>

<pre><code>`&lt;code&gt;` spans are delimited
by backticks.

You can include literal backticks
like `` `this` ``.
</code></pre>

<h3>Preformatted Code Blocks</h3>

<p>Indent every line of a code block by at least 4 spaces or 1 tab.</p>

<pre><code>This is a normal paragraph.

    This is a preformatted
    code block.
</code></pre>

<h3>Horizontal Rules</h3>

<p>Three or more dashes or asterisks:</p>

<pre><code>---

* * *

- - - - 
</code></pre>

<h3>Manual Line Breaks</h3>

<p>End a line with two or more spaces:</p>

<pre><code>Roses are red,   
Violets are blue.
</code>
');

INSERT INTO post VALUES(1,'teste de um novo titulo agora com slug e tal é ! assim','teste-de-um-novo-titulo-agora-com-slug-e-tal---assim','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget orci tellus. Phasellus in metus enim, feugiat placerat velit. Aenean iaculis, libero ac laoreet eleifend, lectus libero fermentum lectus, eget convallis mi leo vel nisl. Suspendisse ac turpis metus, ac porta erat. Nulla nec magna nisl. ','','2012-08-12 00:14:19.577591','2012-08-12 00:14:19.577630','','N',NULL);
INSERT INTO post VALUES(2,'outro post','outro-post','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget orci tellus. Phasellus in metus enim, feugiat placerat velit. Aenean iaculis, libero ac laoreet eleifend, lectus libero fermentum lectus, eget convallis mi leo vel nisl. Suspendisse ac turpis metus, ac porta erat. Nulla nec magna nisl. ','

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dolor sem, aliquam in tempus in, viverra a arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam euismod purus ante, nec ultricies elit. Donec aliquet lacus a diam egestas ut cursus dolor fringilla. Vestibulum non metus odio, quis blandit dui. Ut justo lorem, mollis et vulputate vitae, dapibus eget ante. Mauris tempus, augue at fringilla scelerisque, ante magna dictum tortor, sed lobortis nulla tortor sed leo. Fusce fringilla enim vitae sapien ornare adipiscing ut a nisi. Sed sem nulla, ornare sed consequat sed, adipiscing et sem. Mauris commodo lobortis ligula, sit amet lacinia justo suscipit vitae.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc laoreet elementum aliquet. Suspendisse posuere sapien tellus, ut facilisis leo. Aenean sollicitudin fermentum pharetra. Nullam vitae ipsum arcu. Quisque malesuada fermentum rutrum. Nam tristique, diam sed sollicitudin laoreet, ante erat dictum dui, at gravida dolor urna et ligula. Suspendisse potenti. Maecenas ligula nisl, sodales vitae dignissim sit amet, porttitor in diam. Aenean odio ante, suscipit et condimentum sed, aliquet sit amet ante. Duis ac ipsum nisi, quis consequat justo. Mauris ac vulputate lorem.

Vivamus eget neque nec quam pharetra faucibus. Donec convallis elementum placerat. Sed dignissim bibendum nunc sit amet porttitor. Fusce at elit egestas tortor malesuada cursus. Mauris interdum vulputate dui, ac interdum tortor dignissim vel. Ut ut sapien in nisi pretium pretium eu id justo. Morbi sagittis sapien ut augue luctus egestas. Nullam magna dolor, commodo sit amet feugiat vitae, ullamcorper a ante. Nam ultrices lacus non lorem vulputate dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras at quam ac dolor accumsan elementum et ut magna. Sed id orci nulla. Mauris nisi tellus, suscipit sed porta nec, interdum at sapien.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla placerat massa ut tortor condimentum tempus. Mauris faucibus eros sed libero ultrices gravida. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam erat volutpat. Fusce elementum consectetur purus, eget scelerisque tortor porttitor eu. Donec faucibus, nisl eget consectetur adipiscing, risus purus pellentesque mauris, vel laoreet metus quam a arcu. Curabitur pretium porta velit, vestibulum semper lorem mollis et. Donec porta mi et lectus pretium pharetra.

Nam a elit augue, sed facilisis est. Quisque pellentesque lorem at ante tincidunt et varius ligula placerat. Vivamus venenatis dui sollicitudin lacus consectetur vitae pretium ante condimentum. Duis sollicitudin, nisi ac hendrerit consequat, massa tortor pulvinar arcu, quis facilisis libero nunc vel eros. Duis dictum mattis porta. Sed quis orci pharetra mi lacinia dictum. Aliquam in tellus sapien, non posuere dolor. Cras pellentesque, erat vitae ullamcorper fermentum, justo est blandit nisi, in lacinia eros est eu ipsum. Sed faucibus, quam quis posuere ultrices, turpis est mattis eros, at imperdiet ipsum metus nec ante. Cras laoreet lectus ut urna pretium sodales. Quisque faucibus ante vitae risus porttitor rhoncus. ','2012-08-12 00:20:55.239945','2012-08-12 00:20:55.239982','','S',NULL);
INSERT INTO post VALUES(3,'aaa','aaa','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget orci tellus. Phasellus in metus enim, feugiat placerat velit. Aenean iaculis, libero ac laoreet eleifend, lectus libero fermentum lectus, eget convallis mi leo vel nisl. Suspendisse ac turpis metus, ac porta erat. Nulla nec magna nisl. ','

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dolor sem, aliquam in tempus in, viverra a arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam euismod purus ante, nec ultricies elit. Donec aliquet lacus a diam egestas ut cursus dolor fringilla. Vestibulum non metus odio, quis blandit dui. Ut justo lorem, mollis et vulputate vitae, dapibus eget ante. Mauris tempus, augue at fringilla scelerisque, ante magna dictum tortor, sed lobortis nulla tortor sed leo. Fusce fringilla enim vitae sapien ornare adipiscing ut a nisi. Sed sem nulla, ornare sed consequat sed, adipiscing et sem. Mauris commodo lobortis ligula, sit amet lacinia justo suscipit vitae.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc laoreet elementum aliquet. Suspendisse posuere sapien tellus, ut facilisis leo. Aenean sollicitudin fermentum pharetra. Nullam vitae ipsum arcu. Quisque malesuada fermentum rutrum. Nam tristique, diam sed sollicitudin laoreet, ante erat dictum dui, at gravida dolor urna et ligula. Suspendisse potenti. Maecenas ligula nisl, sodales vitae dignissim sit amet, porttitor in diam. Aenean odio ante, suscipit et condimentum sed, aliquet sit amet ante. Duis ac ipsum nisi, quis consequat justo. Mauris ac vulputate lorem.

Vivamus eget neque nec quam pharetra faucibus. Donec convallis elementum placerat. Sed dignissim bibendum nunc sit amet porttitor. Fusce at elit egestas tortor malesuada cursus. Mauris interdum vulputate dui, ac interdum tortor dignissim vel. Ut ut sapien in nisi pretium pretium eu id justo. Morbi sagittis sapien ut augue luctus egestas. Nullam magna dolor, commodo sit amet feugiat vitae, ullamcorper a ante. Nam ultrices lacus non lorem vulputate dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras at quam ac dolor accumsan elementum et ut magna. Sed id orci nulla. Mauris nisi tellus, suscipit sed porta nec, interdum at sapien.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla placerat massa ut tortor condimentum tempus. Mauris faucibus eros sed libero ultrices gravida. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam erat volutpat. Fusce elementum consectetur purus, eget scelerisque tortor porttitor eu. Donec faucibus, nisl eget consectetur adipiscing, risus purus pellentesque mauris, vel laoreet metus quam a arcu. Curabitur pretium porta velit, vestibulum semper lorem mollis et. Donec porta mi et lectus pretium pharetra.

Nam a elit augue, sed facilisis est. Quisque pellentesque lorem at ante tincidunt et varius ligula placerat. Vivamus venenatis dui sollicitudin lacus consectetur vitae pretium ante condimentum. Duis sollicitudin, nisi ac hendrerit consequat, massa tortor pulvinar arcu.','2012-08-12 00:25:29.239522','2012-08-12 00:25:29.239559','','S',NULL);
INSERT INTO post VALUES(4,'asda dasd asdad asd  ','asda-dasd-asdad-asd--','Somente um pequeno resumo para ver como fica.','**Somente uma pequena frase**

Agora um *italico* no meio do texto.

E apenas um http://berlotto.net

','2012-08-12 00:32:20.676066','2012-08-12 00:32:20.676127','','N',NULL);
INSERT INTO post VALUES(5,'teste','teste',NULL,'','2012-08-13 23:12:13.220311','2012-08-13 23:12:13.220351','','N',NULL);
INSERT INTO post VALUES(6,'asdasdasd','asdasdasd',NULL,'','2012-08-13 23:16:12.247857','2012-08-13 23:16:12.247894','','N',NULL);
INSERT INTO post VALUES(7,'hahaha','hahaha',NULL,'','2012-08-13 23:19:35.248836','2012-08-13 23:19:35.248890','','N',NULL);
INSERT INTO post VALUES(8,'O último dos moicanos','o-ultimo-dos-moicanos',NULL,'','2012-08-14 09:59:23.913460','2012-08-14 09:59:23.913500','','featured',NULL);
INSERT INTO post VALUES(9,'Teste de Markdown','teste-de-markdown',NULL,'','2012-08-16 13:51:58.760976','2012-08-16 13:51:58.761024','','N',NULL);
INSERT INTO post VALUES(10,'mark0 teste','mark0-teste',NULL,'','2012-08-18 00:26:42.948260','2012-08-18 00:26:42.948314','','N',NULL);
INSERT INTO post VALUES(11,'Novo post ! Há','novo-post-ha',NULL,'# Titulo

## Secao 1

Veja como você consegue fazer isto bem legal

    import random
    print [random.randint(1,100) for x in xrange(10)]
    
Legal !

Isto gera um array com numeros **randomicos** não unicos.','2012-08-18 01:02:00.781002','2012-08-18 01:02:00.781053','','N',NULL);
INSERT INTO post VALUES(12,'hahaha hahaha','hahaha-hahaha',NULL,'##Titulo do post... 

com mais conteudo

1. Lista
2. Item 2
3. Item 3

''Italico ?'' ou **Negrito** ?','2012-08-18 15:27:44.453076','2012-08-18 15:27:44.453124','','N',NULL);
INSERT INTO post VALUES(13,'gaga','gaga',NULL,'**gaga**

Feito!','2012-08-18 23:46:30.642641','2012-08-18 23:46:30.642685','','N',NULL);
INSERT INTO post VALUES(14,'gugugugu','gugugugu',NULL,'
showProcessing = function(){
  $.blockUI({ message: ''<h1><img src="/static/img/loading.gif" /> Salvando os dados...</h1>'' });
}

hideProcessing = function(){
  $.unblockUI();
}','2012-08-19 00:11:13.537215','2012-08-19 00:11:13.537251','','N',NULL);
INSERT INTO post VALUES(15,'ZZZzzzz','zzzzzzz',NULL,'options options options options 

options 
options options options 

options options options ','2012-08-19 00:19:35.595488','2012-08-19 00:19:35.595526','','featured',NULL);
INSERT INTO post VALUES(16,'0100992019212- 0i1jfgndfj120j2gp','0100992019212-0i1jfgndfj120j2gp',NULL,'options options options options options options options options options options options options options 

options options options options options options options options options 






options options options options options options options options options options options 

options options 


options options options options options options options options options options options options options options options options options ','2012-08-19 00:24:58.896733','2012-08-19 00:24:58.896766','','featured',NULL);
INSERT INTO post VALUES(17,'daniella karoline de souza berlotto','daniella-karoline-de-souza-berlotto',NULL,'Minha linda e tal

Faz tudo pra mim

Eu amo de paixão

E me deu o presente mais importante da minha vida
','2012-08-19 00:38:14.654033','2012-08-19 00:38:14.654069','','featured',NULL);
INSERT INTO post VALUES(18,'koko','koko',NULL,'koko    ','2012-08-19 00:39:54.924524','2012-08-19 00:39:54.924562','','featured',NULL);
INSERT INTO post VALUES(19,'Outro novo post...','outro-novo-post',NULL,'Adas ad
A
s 
As
 asdadasgagasg agasgsga sgag asgaga
 a
 
 asg as ga
 a
 
 
 asg asg asg aga ','2012-08-19 01:01:01.836251','2012-08-19 01:01:01.836286','','N',NULL);
INSERT INTO post VALUES(20,'API Reference','api-reference','A Flask-SQLALchemy dcumentation','If you are looking for information on a specific function, class or method, this part of the documentation is for you.','2012-08-19 02:29:09.801413','2012-08-19 02:29:09.801506','','N',NULL);
INSERT INTO post VALUES(21,'Cinnamon no ArchLinux','cinnamon-no-archlinux','O Cinnamon &eacute; um ambiente desktop que tem caracter&iacute;sticas avan&ccedil;adas e inovadoras mantendo a tradicional experi&ecirc;ncia do usu&aacute;rio. O seu layout &eacute; parecida ao tradicional Gnome 2, no entando a tecnologia utlizada &eacute; provida do novo Gnome Shel, que prov&ecirc; novas bibliotecas e um ambiente mais bonito. O foco &eacute; no usu&aacute;rio, querendo lhe dar um ambiente agrad&aacute;vel com uma &oacute;tima experi&ecirc;ncia no desktop.','Ultimamente tenho trabalhado no meu note com muitos programas abertos, webserver, banco de dados, etc... o que deixou a coisa meio feia em quest&atilde;o de processamento e mem&oacute;ria, j&aacute; que meu note n&atilde;o &eacute; nada de mais. Ent&atilde;o procurei um jeito de amenizar isto trocando meu atual Gnome3 por um ambiente mais leve, n&atilde;o que o Gnome 3 seja pesado, longe disto, mas queria um mais leve ainda.

Ent&atilde;o dei uma pesquisada por ai e lembrei que tinham falado muito bem do tal Cinnamon.

O que &eacute; o Cinnamon ?

O Cinnamon &eacute; um ambiente desktop que tem caracter&iacute;sticas avan&ccedil;adas e inovadoras mantendo a tradicional experi&ecirc;ncia do usu&aacute;rio. O seu layout &eacute; parecida ao tradicional Gnome 2, no entando a tecnologia utlizada &eacute; provida do novo Gnome Shel, que prov&ecirc; novas bibliotecas e um ambiente mais bonito. O foco &eacute; no usu&aacute;rio, querendo lhe dar um ambiente agrad&aacute;vel com uma &oacute;tima experi&ecirc;ncia no desktop.

O Cinnamon, ainda vem crescendo, apesar de ter dado um belo salto j&aacute; neste sentido, utilizando ele senti que &eacute; um ambiente j&aacute; completo e est&aacute;vel, com muito poucos bugs e bem funcional.

Ent&atilde;o vamos a instala&ccedil;&atilde;o dele no arch linux. No Arch este pacote ainda nao est&aacute; no community, mas ele &eacute; facilmente instalado pelo AUR (Arch Linux User Repository).

<pre>$ yaourt -S cinnamon </pre>

Beleza, agora j&aacute; temos o cinnamon instalado.

Se voc&ecirc; utiliza algum login manager como Gdm ou Kdm ent&atilde;o o Cinnamon j&aacute; estar&aacute; dispon&iacute;vel, mas se utiliza algum outro como Slim por exemplo, coloque a seguinte linha no seu ~/.xinitrc

<pre>exec ck-launch-session gnome-session-cinnamon</pre>

E como o Gnome, o Cinnamon tamb&eacute;m possibilita acrescentar extens&otilde;es e temas, e voc&ecirc; pode encontr&aacute;-las no seguinte link: <a href="http://cinnamon-spices.linuxmint.com/">http://cinnamon-spices.linuxmint.com/</a>, mas al&eacute;m disto voc&ecirc; tamb&eacute;m pode instal&aacute;-las via AUR tamb&eacute;m (agrade&ccedil;a aos usu&aacute;rios dos ArchLinux!) veja na lista o que temos dispon&iacute;vel: <a href="http://aur.archlinux.org/packages.php?O=0&amp;K=cinnamon&amp;do_Search=Go">http://aur.archlinux.org/packages.php?O=0&amp;K=cinnamon&amp;do_Search=Go</a>

O Cinnamon &eacute; criado pelo time do LinuxMint e o reposit&oacute;rio do seu c&oacute;digo est&aacute; no GitHub ( <a href="https://github.com/linuxmint/Cinnamon/">https://github.com/linuxmint/Cinnamon/</a> ).

Minha esposa me alertou que Cinnamon significa &ldquo;canela&rdquo;, e me disse que tem uma &oacute;tima receita de uns p&atilde;ezinhos chamados &ldquo;Cinnamon Rolls&rdquo;, ent&atilde;o ja''aproveito para deixar a dica ai tamb&eacute;m =&gt; <a href="http://pecadodagula.blogspot.com.br/2006/01/cinnamon-rolls.html">http://pecadodagula.blogspot.com.br/2006/01/cinnamon-rolls.html</a>

&Eacute; isto pessoal, agora comentem sobre este desktop e digam o que voc&ecirc;s acham dele. Contem-me alguma das suas experi&ecirc;ncias com ele.','2012-08-20 15:56:12.991218','2012-08-20 15:56:12.991349','','N',NULL);
INSERT INTO post VALUES(22,'Usando o Python com Virtualenv','usando-o-python-com-virtualenv','Saiba como utilizar vários ambientes de teste e desenvolvimento com o Python, utilizando o Virtualenv.','Bom pessoal, o python muita gente j&aacute; conhece, mas alguns ainda n&atilde;o conhecem ou n&atilde;o sabem como utilizar o Virtualenv.<br /><br />O virtualenv &eacute; um programa que o ajuda a isolar um "set" de bibliotecas do seu ambiente padr&atilde;o do Python, ou seja, com ele voc&ecirc; consegue instalar, reinstalar, excluir e testar todo o tipo de libs sem que necessite de permiss&otilde;es de escrita no sistema padr&atilde;o, e sem afet&aacute;-lo tamb&eacute;m.<br /><br />&Eacute; muito simples instal&aacute;-lo, at&eacute; porque existe pacote para ele em praticamente todas as distribui&ccedil;&otilde;es linux. Mas o jeito mais f&aacute;cil e pythonista de fazer isto &eacute; instal&aacute;-lo pelo "pip".<br /><br />O pip &eacute; uma evolu&ccedil;&atilde;o do easy_install, os quais buscam e instalam bibliotecas python atrav&eacute;s do site http://pypi.python.org/pypi .<br /><br />Ent&atilde;o vamos l&aacute;, vamos montar um pequeno ambiente isolado com o FLask (um microframework web).<br /><br />Primeiramente voc&ecirc; necessita ter j&aacute; instalado o pacote "setuptools" do python.<br /><br />Agora instalmos o virtualenv com o comando abaixo:<br /><br /><span style="font-family: courier new,courier;"># pip install virtualenv</span><br /><br />Feito isto, podemos montar nosso ambiente, que vai se chamar "flask_env".<br /><br /><span style="font-family: courier new,courier;">$ virtualenv --no-site-packages flask_env</span><br /><br />Com este comando criamos um ambiente completamente isolado do ambiente geral do python instalado no sistema. Se tirar-mos o par&acirc;metro "--no-site-packages" criamos um ambiente que utiliza tamb&eacute;m as libs instaladas no sistema.<br /><br />Agora, para utilizar seu novo ambiente &eacute; necess&aacute;rio ativ&aacute;-lo, para isto use o comando abaixo:<br /><br /><span style="font-family: courier new,courier;">$ source flask_env/bin/activate</span><br /><br />Assim teremos um prompt mais ou menos neste formato:<br /><br /><span style="font-family: courier new,courier;">(flask_env)berlotto@darthvader ~ $</span> <br /><br />Isto nos informa que estamos utilizando o virtualenv chamado "flask_env". Nele &eacute; que vamos instalar as novas bibliotecas.<br /><br />Ent&atilde;o podemos utilizar o comando pip sem necessidade de utilizar o sudo.<br /><br /><span style="font-family: courier new,courier;">$ pip install flask</span><br /><br />O Flask ser&aacute; instalado a partir do diret&oacute;rio "flask_env".<br /><br />Agora podemos criar nossa aplica&ccedil;&atilde;o e tamb&eacute;m instalar todas as nossas bibliotecas necess&aacute;rias sem interferir na instala&ccedil;&atilde;o python do sistema.<br /><br />Ok ! Agora, para voltar-mos a utilizar nosso ambiente python padr&atilde;o do sistema, devemos desativar o virtualenv. Usamos o comando abaixo:<br /><br /><span style="font-family: courier new,courier;">$ deactivate</span><br /><br />Simples!<br /><br />Ent&atilde;o &eacute; isto, este &eacute; um pequeno tutorial para utilizar o virtualenv, depois vou fazer outro mostrando como utilizar o virtualenv-wrapper, um aplicativo usado para organizar v&aacute;rios ambientes virtuais.<br /><br />At&eacute; l&aacute;.','2012-08-20 16:10:48.449314','2012-08-20 16:10:48.449414','','N',NULL);
INSERT INTO post VALUES(23,'Upvídeos','upvideos','Saiba mais sobreo Upvideos, um sisteminha de upload de vídeos open-source','O upvideos &eacute; um pequeno software de uploads de videos para serem visualizados embedded em outros sites.<br />A moral dele &eacute; ser um servidor de v&iacute;deos centralizado. Ou seja, voc&ecirc; sobe seus v&iacute;deos em uma m&aacute;quina que somente ir&aacute; fazer isto, e os utiliza incorporado em outro site.<br /><br />Ele n&atilde;o &eacute; feito para ser um youtube da vida, at&eacute; porque ele tem um admin simples e poucas fun&ccedil;&otilde;es, que s&atilde;o basicamente:<br /><br />
<ul>
<li>upload de v&iacute;deos ogg</li>
<li>visualiza&ccedil;&atilde;o do v&iacute;deo</li>
<li>tamanho do v&iacute;deo e poster customiz&aacute;vel</li>
<li>player de v&iacute;deo html5 j&aacute; incorporado</li>
<li>c&oacute;digo de incorpora&ccedil;&atilde;o pronto</li>
<li>exclus&atilde;o de v&iacute;deos</li>
<li>visualiza&ccedil;&atilde;o do poster</li>
<li>controle de login para upload , ativado ou desativado</li>
</ul>
<br />Basicamente ele foi feito para a equipe do site softwarelivre.org poder gerenciar mais facilmente seus v&iacute;deos e poder incorpor&aacute;-los no seu site que &eacute; Noosfero.<br /><br />Ele &eacute; feito com o framework Flask e utiliza o player ''videojs''.<br /><br />Seu c&oacute;digo est&aacute; dispon&iacute;vel via Git em: https://bitbucket.org/berlotto/upvideos<br /><br />Basta clonar o reposit&oacute;rio e utiliz&aacute;-lo como quiser, respeitando a GPLv3.<br /><br />Seria legal poder contar com mais alguem para melhorar ainda mais o projeto, pois ele est&aacute; funcional, mas bem simples. <br />Aguardo voc&ecirc;s!<br /><br />','2012-08-20 16:12:20.129258','2012-08-20 16:12:20.129309','','N',NULL);
INSERT INTO post VALUES(24,'Como aprender a programar com Python!','como-aprender-a-programar-com-python','Sabe, volta e meia alguem me pergunta sobre como aprender a programar em Python, principalmente por eu gostar desta linguagem. Veja o que eu penso sobre isto.','Sabe, volta e meia alguem me pergunta sobre como aprender a programar em Python, principalmente por eu gostar desta linguagem, divulgar bastante isto e por ela estar crescendo muito em visibilidade nos ultimos tempos.<br /><br />Pois bem! Vamos aos pontos !<br /><br />A pergunta que geralmente surge &eacute;: Por onde eu come&ccedil;o para aprender a programar em Python ?<br /><br />Digo, DEPENTE ! Claro, depente de o quanto voc&ecirc; sabe sobre inform&aacute;tica em geral. Programar n&atilde;o &eacute; simplesmente soltar linhas de c&oacute;digo em um editor de texto ou ide completa, cheia de frescuras. Programar &eacute; unir muitas informa&ccedil;&otilde;es e conhecimentos em prol de resolver um problema, seja ele grande ou pequeno. Tudo o que voc&ecirc; sabe &eacute; utilizado na hora de programar, seu conhecimento de redes, sistemas operacionais, processadores, mem&oacute;ria ram, swap, etc. Mas o que rege a programa&ccedil;&atilde;o principalmente &eacute; sua matem&aacute;tica, seu conhecimento de l&oacute;gica.<br /><br />Algoritimos, veja trechos do que diz na wikipedia sobre este assunto:<br /><br />"Um algoritmo &eacute; uma sequ&ecirc;ncia finita de instru&ccedil;&otilde;es bem definidas e n&atilde;o amb&iacute;guas, cada uma das quais pode ser executada mecanicamente num per&iacute;odo de tempo finito e com uma quantidade de esfor&ccedil;o finita.<br /><br />Um algoritmo n&atilde;o representa, necessariamente, um programa de computador, e sim os passos necess&aacute;rios para realizar uma tarefa. Sua implementa&ccedil;&atilde;o pode ser feita por um computador, por outro tipo de aut&ocirc;mato ou mesmo por um ser humano."<br /><br />Ou seja, o algorimito &eacute; o conjunto de instru&ccedil;&otilde;es que resolvem um problema, os passos necess&aacute;rios para realizar uma tarefa. Em um programa de computador &eacute; o que rege prioritariamente o seu funcionamento. Voc&ecirc; precisa, antes de programar, saber o tipo de programa a se fazer, e o que tem que resolver para poder montar seu(s) algor&iacute;timo(s) e depois programar com sua linguagem preferida. Com o tempo, voc&ecirc; j&aacute; cria v&aacute;rios algoritimos na hora, e jai codificando, pois se pega experi&ecirc;ncia ao fazer isto todos os dias. Treino &eacute; importante, e esta &eacute; a raz&atilde;o de ser necess&aacute;rio fazer tantos exerc&iacute;cios.<br /><br />Tamb&eacute;m &eacute; importante voc&ecirc; saber sobre estrutura de dados, sobre a infra-estrutura que ter&aacute; dispon&iacute;vel para seu programa, se for um sistema Web, se for um sistema Desktop, se for um daemon, se for uma programa&ccedil;&atilde;o paralela e/ou em grid, etc, pois tamb&eacute;m isto influenciar&aacute; sua programa&ccedil;&atilde;o. Voc&ecirc; pode muito bem mesclar v&aacute;rias tecnologias destas como por exemplo fazer um sistema web que tem partes que rodam em paralelo.<br /><br />Na maioria dos casos que me dizem que nunca programaram, que tem pouco conhecimento de l&oacute;gica e tal, mas querem aprender Python &eacute; que procurem um curso T&eacute;cnico. Mas da&iacute; voc&ecirc; pergunta: --Mas tem tanto material na internet, porque n&atilde;o d&aacute; para aprender a programar assim ?<br />Minha resposta &eacute;: Voc&ecirc; j&aacute; viu um biol&oacute;go ou eletronico formado na internet, mesmo tendo uma imensid&atilde;o de material na internet ? Claro que n&atilde;o! Isto &eacute; porque aprender algo sobre um pequeno assunto, ou aprimorar seu conhecimento com novas experi&ecirc;ncias &eacute; realmente v&aacute;lido e o material da internet, sendo sempre muito bem selecionado, serve. Agora, buscar um conhecimento com de tamanha grandeza n&atilde;o &eacute; simples, e precisa mesmo de uma estrutura a mais do que a internet, de conhecimentos e explica&ccedil;&otilde;es que geralmente n&atilde;o se encontra na internet.<br /><br />Ent&atilde;o resumindo: se voc&ecirc; n&atilde;o sabe nada busque o conhecimento em um curso t&eacute;cnico, pague um pouco, invista em voc&ecirc;, e depois utilize seu conhecimento como base para se aprimorar com as experi&ecirc;ncias compartilhadas.<br /><br />Da&iacute; se voc&ecirc; tem algum conhecimento, agora podes vir me perguntar sobre Python ! <br />:-)
E ai, o que voc&ecirc; acha sobre isto ? J&aacute; passou por alguma destas ?','2012-08-20 16:13:24.371418','2012-08-20 16:13:24.371519','','N',NULL);
INSERT INTO post VALUES(25,'Um pequeno resumo do Gabinete Digital no FISL13','um-pequeno-resumo-do-gabinete-digital-no-fisl13','O maior evento de tecnologia da Am&eacute;rica Latina discute software livre, dados abertos e liberdade na internet.','<iframe style="border: 0;" src="http://gabinetedigital.rs.gov.br/videos/embed/67" width="490" height="290"></iframe>

O maior evento de tecnologia da Am&eacute;rica Latina discute software livre, dados abertos e liberdade na internet, com a presen&ccedil;a do vice-governador do RS, Beto Grill e a equipe do Gabinete Digital, a qual eu perten&ccedil;o atualmente.','2012-08-20 16:14:34.109119','2012-08-20 16:14:34.109169','','N',NULL);
INSERT INTO post VALUES(26,'Jquery File Upload','jquery-file-upload','jQuery File Upload Plugin Information','# jQuery File Upload Plugin

## Demo
[Demo File Upload](http://blueimp.github.com/jQuery-File-Upload/)

## Setup instructions
* [How to setup the plugin on your website](https://github.com/blueimp/jQuery-File-Upload/wiki/Setup)
* [How to use only the basic plugin (minimal setup guide).](https://github.com/blueimp/jQuery-File-Upload/wiki/Basic-plugin)

## Features
* **Multiple file upload:**  
  Allows to select multiple files at once and upload them simultaneously.
* **Drag & Drop support:**  
  Allows to upload files by dragging them from your desktop or filemanager and dropping them on your browser window.
* **Upload progress bar:**  
  Shows a progress bar indicating the upload progress for individual files and for all uploads combined.
* **Cancelable uploads:**  
  Individual file uploads can be canceled to stop the upload progress.
* **Resumable uploads:**  
  Aborted uploads can be resumed with browsers supporting the Blob API.
* **Chunked uploads:**  
  Large files can be uploaded in smaller chunks with browsers supporting the Blob API.
* **Client-side image resizing:**  
  Images can be automatically resized on client-side with browsers supporting the required JS APIs.
* **Preview images:**  
  A preview of image files can be displayed before uploading with browsers supporting the required JS APIs.
* **No browser plugins (e.g. Adobe Flash) required:**  
  The implementation is based on open standards like HTML5 and JavaScript and requires no additional browser plugins.
* **Graceful fallback for legacy browsers:**  
  Uploads files via XMLHttpRequests if supported and uses iframes as fallback for legacy browsers.
* **HTML file upload form fallback:**  
  Shows a standard HTML file upload form if JavaScript is disabled.
* **Cross-site file uploads:**  
  Supports uploading files to a different domain with Cross-site XMLHttpRequests.
* **Multiple plugin instances:**  
  Allows to use multiple plugin instances on the same webpage.
* **Customizable and extensible:**  
  Provides an API to set individual options and define callBack methods for various upload events.
* **Multipart and file contents stream uploads:**  
  Files can be uploaded as standard "multipart/form-data" or file contents stream (HTTP PUT file upload).
* **Compatible with any server-side application platform:**  
  Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.

## Requirements
* [jQuery](http://jquery.com/) v. 1.6+
* [jQuery UI widget factory](http://wiki.jqueryui.com/w/page/12138135/Widget%20factory) v. 1.8+
* [jQuery Iframe Transport plugin](https://github.com/blueimp/jQuery-File-Upload/blob/master/jquery.iframe-transport.js) (included)
* [JavaScript Templates engine](https://github.com/blueimp/JavaScript-Templates) v. 2.1.0+ (optional)
* [JavaScript Load Image function](https://github.com/blueimp/JavaScript-Load-Image) v. 1.1.6+ (optional)
* [JavaScript Canvas to Blob function](https://github.com/blueimp/JavaScript-Canvas-to-Blob) v. 2.0.0+ (optional)
* [Bootstrap CSS Toolkit](https://github.com/twitter/bootstrap/) v. 2.0+ (optional)

The jQuery UI widget factory is a requirement for the basic File Upload plugin, but very lightweight without any other dependencies.  
The jQuery Iframe Transport is required for [browsers without XHR file upload support](https://github.com/blueimp/jQuery-File-Upload/wiki/Browser-support).  
The UI version of the File Upload plugin also requires the JavaScript Templates engine as well as the JavaScript Load Image and JavaScript Canvas to Blob functions (for the image previews and resizing functionality). These dependencies are marked as optional, as the basic File Upload plugin can be used without them and the UI version of the plugin can be extended to override these dependencies with alternative solutions.

The User Interface is built with Twitter''s [Bootstrap](https://github.com/twitter/bootstrap/) Toolkit. This enables a CSS based, responsive layout and fancy transition effects on modern browsers. The demo also includes the [Bootstrap Image Gallery Plugin](https://github.com/blueimp/Bootstrap-Image-Gallery). Both of these components are optional and not required.

The repository also includes the [jQuery XDomainRequest Transport plugin](https://github.com/blueimp/jQuery-File-Upload/blob/master/js/cors/jquery.xdr-transport.js), which enables Cross-domain AJAX requests (GET and POST only) in Microsoft Internet Explorer >= 8. However, the XDomainRequest object doesn''t support file uploads and the plugin is only used by the [Demo](http://blueimp.github.com/jQuery-File-Upload/) for Cross-domain requests to delete uploaded files from the demo file upload service.

[Cross-domain File Uploads](https://github.com/blueimp/jQuery-File-Upload/wiki/Cross-domain-uploads) using the [Iframe Transport plugin](https://github.com/blueimp/jQuery-File-Upload/blob/master/js/jquery.iframe-transport.js) require a redirect back to the origin server to retrieve the upload results. The [example implementation](https://github.com/blueimp/jQuery-File-Upload/blob/master/js/main.js) makes use of [result.html](https://github.com/blueimp/jQuery-File-Upload/blob/master/cors/result.html) as a static redirect page for the origin server.

## Browser Support (tested versions)
* Google Chrome - 7.0+
* Apple Safari - 4.0+
* Mozilla Firefox - 3.0+
* Opera - 10.0+
* Microsoft Internet Explorer 6.0+

Drag & Drop is only supported on Google Chrome, Firefox 4.0+, Safari 5.0+ and Opera 12.0+.  
Microsoft Internet Explorer has no support for multiple file selection or upload progress.  
[Extended browser support information](https://github.com/blueimp/jQuery-File-Upload/wiki/Browser-support).

## License
Released under the [MIT license](http://www.opensource.org/licenses/MIT).','2012-08-21 14:10:51.211234','2012-08-21 14:10:51.211288','','N','jquery, media, upload');
COMMIT;
