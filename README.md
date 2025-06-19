### Banco-de-Dados

#### Relatório de Esquema de Banco de Dados Normalizado

Pessoa (cpf​, gênero, nascimento, nome, cep∗, num_endereço*)
	cep, num_endereço referência Endereço(cep, num_endereço)

Forma Normal: 3FN
Todos os atributos dependem unicamente da chave primária cpf. Além disso, cep foi separado para a tabela Endereço, eliminando dependências transitivas.	

Endereço (cep​, num_endereço, complemento, rua, bairro, cidade)
Forma Normal: 3FN 
A chave primária é cep, e todos os atributos dependem diretamente dela, sem repetições ou dependências parciais/transitivas

Telefone (cpf_p∗​, telefone​)
	cpf_p referência Pessoa(cpf)    
Forma Normal: 1FN 
Elimina multivalorados(ex: múltiplos telefones por pessoa), associando cada telefone a um cpf_p. Garante atomicidade e unicidade.

Email (cpf_e​, email​) 
	cpf_e referência Pessoa(cpf_c).
Forma Normal: 1FN
Garante que não há grupos repetitivos e que os dados estão atômicos. Cada e-mail está associado a um cpf único

Cliente (cpf_c∗​, cpf_indicador∗)
	cpf_c referência Pessoa(cpf).
	cpf_indicador referência Cliente(cpf_c)
Forma Normal: 3FN 
A chave primária é cpf_c, e o único atributo adicional (cpf_indicador) depende diretamente dela, sem dependências parciais ou transitivas. A estrutura evita redundâncias e garante integridade

Dependente (cpf_responsavel∗​, num_seq​, nome)
	cpf_responsavel referência Cliente(cpf_c).
Forma Normal: 3FN
cpf_responsavel e num_seq formam a chave. Nome depende totalmente dessa composição, sem transitividade.

Funcionário (cpf_f∗​, titulo_cargo∗, num_alugueis, turno, cpf_supervisionador) 
	cpf_f referência Pessoa(cpf).
	cpf_gerente referência Funcionário(cpf_f)
titulo_cargo referência Cargo(título) 

Forma Normal: 3FN 

Atributos dependem da chave cpf_f. As referências a Gerente e Cargo evitam redundâncias e transitividades.

Cargo (título​, salário)
Forma Normal: 3FN 
O atributo salário depende exclusivamente do título, que é a chave primária. Todos os dados estão atômicos e não há nenh*uma dependência parcial ou transitiva

Gerente (cpf_g∗​, data_promoção, num_subordinados)
	cpf_g referência Funcionário(cpf_f).
Forma Normal: 3FN 
cpf_g é chave primária e os demais dados dependem totalmente dela. Sem dependência transitiva.

Produto (id​, titulo, tamanho, lançamento, estoque, qnt_alugada)
Forma Normal: 3FN 
Todos os atributos dependem diretamente da chave id. Não há atributos que dependem uns dos outros

Gênero_produto (id_produto∗​, genero​) 
	id_produto referência Produto(id).
Forma Normal: 1FN 
Relacionamento N:N resolvido por tabela auxiliar. Uma entrada por linha, sem repetições

Produtora_produto (id_produto∗​, produtora​) 
	id_produto referência Produto(id).
Forma Normal: 1FN
Cada linha representa um vínculo entre produto e produtora. Estrutura atômica e sem repetições. 

Criadores_produto (id_produto∗​, criadores​) (1FN)
	id_produto referência Produto(id).
Forma Normal: 1FN 
Cada criador por linha evita repetições. Está em forma atômica.

Conta (num​, criação, credito, qnt_alugados, cpf_c*) 
	cpf_c referência Cliente(cpf_c)
Forma Normal: 3FN 
Cada conta tem num como chave primária, com atributos diretamente dependentes. Cliente referenciado separadamente, não há dependência transitiva.


Bônus (id​, valor)
Forma Normal: 3FN
A chave primária é o campo id, e o atributo valor depende diretamente e unicamente dele, sem qualquer tipo de dependência parcial ou transitiva

Ganha (cpf_c∗​, num∗​, id∗​)
	cpf_c e num referência Cliente_conta(cpf_c e num), 
	id referência Bônus(id).
Forma Normal: 3FN 
cpf_c, num, e id formam a chave. Nenhum outro atributo depende parcialmente dela.

Avalia (cpf_c∗​, id∗​, valor)
	cpf_c referência Cliente(cpf_c).
	idreferência Produto(id).
Forma Normal: 3FN 
O valor depende da combinação de cpf_c e id, sem dependências transitivas. 

Avalia2 (cpf_responsavel∗​, num_seq∗​, id∗​, valor)
	cpf_responsável e num_seq referência para Dependente(cpf_resposavel e num_seq)
	id referência Produto(id).
Forma Normal: 3FN
O valor depende da chave composta . Nenhuma dependência parcial ou transitiva.

Aluga (cpf_f∗​, num∗​, id∗​, data_inicio, multa, preço, forma_pgmto, prazo_devolução)
	cpf_f referência Funcionário(cpf_f).
	num referência  Conta(num).
	id referência  Produto(id).
Forma Normal: 3FN 
Chave composta entre cpf_f, num e id. Os demais atributos dependem totalmente dessa chave.
