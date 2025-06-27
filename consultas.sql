

--16----23


/*16. LEFT ou RIGHT ou FULL OUTER JOIN---------
17. SUBCONSULTA COM OPERADOR RELACIONAL------
18. SUBCONSULTA COM IN---------
19. SUBCONSULTA COM ANY--------
20. SUBCONSULTA COM ALL------
21. ORDER BY--------------
22. GROUP BY
23. HAVING
*/


---Número de venda dos funcionário agrupados por homem  mulher
SELECT  P.genero, SUM(F.num_alugueis)  
from Pessoa P
JOIN Funcionario F ON P.cpf=F.cpf_f
WHERE F.cargo != 'Supervisor'
GROUP BY P.genero


----mandar email pros cliente que moram perto da locadora, avisando de uma noite de filme na frente da locadora
SELECT E.email
FROM Email E
WHERE E.cpf_e IN (SELECT C.cpf_c
                FROM  Cliente C
                JOIN Pessoa P ON C.cpf_c=P.cpf
                JOIN Endereco EN ON P.cep=EN.cep AND P.num_endereco=EN.num_endereco
                WHERE EN.bairro IN ('Várzea', 'CDU', 'Brasilit') AND (SYSDATE - P.nascimento) >= (18 * 365))


-------- pecas alugadas dos produtos
SELECT P.qnt_alugada, P.titulo
FROM Produto P
ORDER BY P.qnt_alugada DESC, P.titulo ASC;

------------TODOS OS CLIENTE  E OS QUAIS GANHARAM BONUS 
SELECT P.nome, id_bonus
FROM Pessoa P
RIGHT JOIN Cliente C ON P.cpf=C.cpf_c
JOIN Conta ON C.cpf_c=Conta.cpf_cc
LEFT JOIN GANHA G ON Conta.num=G.num_conta



--- avaliacões dos produtos (feita pelos clientes)(tirando a pior das avaliaçoes)
SELECT P.titulo, AV.valor
from Avalia  AV
JOIN Produto P on AV.id=P.id
WHERE AV.valor > ANY (SELECT AV2.valor
                    FROM Avalia AV2
                    WHERE AV2.id = AV.id)


---  funcionario qeu mais vendoeu
SELECT P.nome, F.num_alugueis
FROM Pessoa P
JOIN Funcionario F ON P.cpf=F.cpf_f
WHERE F.num_alugueis>= ALL(SELECT F2.num_alugueis
                        FROM Funcionario F2
                        WHERE F2.cpf_f != F.cpf_f
                        )

---Produtos having  media da avaliacao  maior que 7
SELECT P.titulo, AVG(AV.valor) AS Média_avaliação
FROM Avalia AV 
JOIN Produto P ON AV.id=P.id
GROUP  BY P.titulo
HAVING AVG(AV.valor)>7
