create table veterinarios (
	id int primary key auto_increment,
    nome varchar(45)
);

delimiter $$ 
create procedure cadastrarVeterinario(in nome_vet varchar(45))
begin
	insert into veterinarios (nome)
		values (nome_vet);
end
$$ delimiter ;

call cadastrarVeterinario("Leticia");
call cadastrarVeterinario("Elissandra");
call cadastrarVeterinario("Desiree");
call cadastrarVeterinario("Bruna");
call cadastrarVeterinario("Patricia");
call cadastrarVeterinario("Guilherme");
call cadastrarVeterinario("Juliana");
call cadastrarVeterinario("Tais");
call cadastrarVeterinario("Paulo");
call cadastrarVeterinario("Camila");

select * from veterinarios;