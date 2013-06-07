$(document).ready( function(){
				$("#numLamp").hide();
				$("#novoUsuario").hide();	
				$("#atualizarUsuario").hide();	
				$("#qtdIlum").hide();
				$("#numAr").hide();
				$("#qtdAr").hide();
				$("#potenciaLamp").hide();
				$("#potencia").hide();

			});

function novoUsuario(){
	$('#dataTable').hide('slow');
	$('#atualizarUsuario').hide('slow');
	$("#novoUsuario").show('slow');
}

var i, j = 1;

$('#ILUMINACAO').click(function(){
		if (i % 2 != 0){
			$("#numLamp").show();
			$("#qtdIlum").show();
			$("#potenciaLamp").show();
			$("#potencia").show();
		}
		else{
			$("#numLamp").hide();
			$("#qtdIlum").hide();
			$("#potenciaLamp").hide();
			$("#potencia").hide();
		}
		i++;
		
});

var k, w = 1;

$('#AR').click(function(){
		if (i % 2 != 0){
			$("#numAr").show();
			$("#qtdAr").show();
		}
		else{
			$("#numAr").hide();
			$("#qtdAr").hide();
		}
		i++;
		
});

$("#reset").click(function(){
	$("#numAr").hide();
	$("#qtdAr").hide();
	$("#numLamp").hide();
	$("#qtdIlum").hide();
});


	

$("#back").click(function(){
	$("#dataTable").show('slow');	
	$("#novoUsuario").hide('show');	
});
$(document).ready( function(){
	$("#form1").validate({
		rules:{
			num:{
					required: true
			},
			ip:{
					required: true
			},
			mac:{
					required: true
			}	
		},
		messages:{
			num:{
					required: "Numero da sala é obrigatório"
			},
			ip:{
					required: "Endereço de Ip é obrigatório"
			},
			mac:{
				required: "Endereço Mac é obirgatorio"
			}

		}
	});
});

function carregarDados(nome, login, nivel){
	$('#dataTable').hide('slow');
	$("#atualizarUsuario").show();	
	$("#atualizarUsuario form input:text.nome").val(nome);
	$("#atualizarUsuario form input:text.llogin").val(login);
}

$("#atualizarUsuario #back").click(function(){
	$("#dataTable").show('slow');	
	$("#atualizarUsuario").hide('show');	
});
