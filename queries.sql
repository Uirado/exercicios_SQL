-- 1
select primeiroNome,ultimoNome from Funcionarios order by ultimoNome;

-- 2
select * from Funcionarios order by cidade;

-- 3
select * from Funcionarios where salario > 1000 order by primeiroNome, segundoNome, UltimoNome;

-- 4
select dataNasc,primeiroNome from Funcionarios order by dataNasc desc;

-- 5
select primeiroNome,ultimoNome, fone from Funcionarios order by primeiroNome, ultimoNome;

-- 6
select sum(salario) as folhaPagamento from Funcionarios;

-- 7
select primeiroNome,ultimoNome, nome, funcao from Funcionarios, Departamentos where Funcionarios.codigoDepartamento = Departamentos.codigo;

-- 8
select Departamentos.*, Funcionarios.primeiroNome, Funcionarios.UltimoNome from Departamentos, Funcionarios where Departamentos.codigoFuncionarioGerente = Funcionarios.codigo;

-- 9
select nome, localizacao, sum(salario) as folhaPagamento from Funcionarios, Departamentos where Departamentos.codigo = Funcionarios.codigoDepartamento group by Departamentos.codigo;

-- 10
select nome, localizacao, primeiroNome, ultimoNome, funcao from Departamentos, Funcionarios where Funcionarios.codigoDepartamento = Departamentos.codigo and funcao = 'Supervisor';

-- 11
select count(Funcionarios.codigo) as totalFuncionarios from Funcionarios
union
select count(codigo) as totalGerentes from Funcionarios where funcao = 'Gerente'
union
select count(codigo) as totalSupervisores from Funcionarios where funcao = 'Supervisor';

-- 12
select avg(salario) from Funcionarios;

-- 13
select max(salario) from Funcionarios where funcao = 'Gerente'
union
select min(salario) from Funcionarios where funcao = 'Gerente'
union
select avg(salario) from Funcionarios where funcao = 'Gerente';

-- 14
select nome, min(salario) as menorSalario from Funcionarios, Departamentos where codigoDepartamento = Departamentos.codigo group by nome;

-- 15
select primeiroNome, segundoNome, ultimoNome from Funcionarios where segundoNome is not null;

-- 16
select nome, primeiroNome, ultimoNome from Departamentos, Funcionarios where codigoDepartamento = Departamentos.codigo order by nome, primeiroNome, ultimoNome;

-- 17
select primeiroNome, ultimoNome from Funcionarios where cidade = 'Recife' and funcao = 'Telefonista';

-- 18
select primeiroNome, ultimoNome from Funcionarios, Departamentos where codigoDepartamento = Departamentos.codigo and nome = 'Pessoal';

-- 19
select naoGerentes.primeiroNome, naoGerentes.ultimoNome, naoGerentes.salario, nome as nomeDepartamento from
(select Funcionarios.* from Funcionarios where funcao != 'Gerente') as naoGerentes,
(select min(salario) as salario from Funcionarios where funcao = 'Gerente') as gerentes,
Departamentos
where naoGerentes.salario > gerentes.salario and naoGerentes.codigoDepartamento = Departamentos.codigo;
