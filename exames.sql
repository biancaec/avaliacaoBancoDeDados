create table exames (
	id int primary key auto_increment,
    descricao varchar(45),
    valor float
);

delimiter $$
create procedure cadastrarExame(in descricao_exame varchar(45), in valor_exame float)
begin
	insert into exames (descricao, valor)
		values (descricao_exame, valor_exame);
end
$$ delimiter ;

call cadastrarExame("Tomografia", 100);
call cadastrarExame("Hemograma", 180);
call cadastrarExame("Ecografia", 150);
call cadastrarExame("Raio-X", 110);
call cadastrarExame("Vitamina D", 130);
call cadastrarExame("Citologico", 210);
call cadastrarExame("Eletrocardiograma", 190);
call cadastrarExame("Urina", 85);
call cadastrarExame("Perfil renal", 140);
call cadastrarExame("Perfil hepático", 140);

delimiter $$
create procedure atualizarValorExame(in exame_id int, in novoValor float)
begin
	update exames
    set valor = novoValor
    where id = exame_id;
end
$$ delimiter ;


select * from exames;
