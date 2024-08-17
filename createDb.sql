CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero CHAR(1) CHECK (genero IN ('M', 'F')),
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco VARCHAR(255),
    data_entrada DATE NOT NULL,
    cor_faixa VARCHAR(20) NOT NULL
);

CREATE TABLE instrutores (
    id_instrutor SERIAL PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    cor_faixa VARCHAR(20) NOT NULL,
    data_contratacao DATE NOT NULL
);

CREATE TABLE aulas (
    id_aula SERIAL PRIMARY KEY,
    nome_aula VARCHAR(100) NOT NULL,
    descricao TEXT,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    dia_semana VARCHAR(10) NOT NULL
);

CREATE TABLE matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_aluno INT REFERENCES alunos(id_aluno) NOT NULL,
    id_aula INT REFERENCES aulas(id_aula) NOT NULL,
    data_matricula DATE NOT NULL
);

CREATE TABLE pagamentos (
    id_pagamento SERIAL PRIMARY KEY,
    id_aluno INT REFERENCES alunos(id_aluno) NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    metodo_pagamento VARCHAR(50) NOT NULL
);

CREATE TABLE eventos (
    id_evento SERIAL PRIMARY KEY,
    nome_evento VARCHAR(100) NOT NULL,
    data_evento DATE NOT NULL,
    local VARCHAR(255) NOT NULL,
    descricao TEXT
);

CREATE TABLE participacoes_eventos (
    id_participacao SERIAL PRIMARY KEY,
    id_aluno INT REFERENCES alunos(id_aluno) NOT NULL,
    id_evento INT REFERENCES eventos(id_evento) NOT NULL,
    data_participacao DATE NOT NULL
);