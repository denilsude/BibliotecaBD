-- Tabela UnidadeAtendimento
CREATE TABLE UnidadeAtendimento (
  codigo INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(200) NOT NULL,
  telefone NUMERIC(10) NOT NULL
);

-- Tabela UnidadeAcademica
CREATE TABLE UnidadeAcademica (
  codigo INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

-- Tabela Curso
CREATE TABLE Curso (
  codigo INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

-- Tabela Disciplina
CREATE TABLE Disciplina (
  codigo INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

-- Tabela FuncionarioBiblioteca
CREATE TABLE FuncionarioBiblioteca (
  matricula INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

-- Tabela Titulo
CREATE TABLE Titulo (
  ISBN NUMERIC(5) PRIMARY KEY,
  nomeTitulo VARCHAR(100) NOT NULL,
  areaPrincip VARCHAR(100) NOT NULL,
  assunto VARCHAR(100) NOT NULL,
  areaSecund VARCHAR(100),
  anoPublic INT,
  editora VARCHAR(50),
  idioma CHAR(1) NOT NULL,
  prazoProfessor INT,
  prazoAluno INT,
  numeroMaxRenov INT
);

-- Tabela CopiaTitulo
CREATE TABLE CopiaTitulo (
  numeroCopia INT PRIMARY KEY,
  localCopia NUMERIC(7) NOT NULL,
  secaoCopia INT NOT NULL,
  estanteCopia INT NOT NULL,
  codigoTitulo INT NOT NULL,
  FOREIGN KEY (codigoTitulo) REFERENCES Titulo(ISBN)
);

-- Tabela UsuarioBiblioteca
CREATE TABLE UsuarioBiblioteca (
  codigoUsu INT PRIMARY KEY,
  nomeUsu VARCHAR(50) NOT NULL,
  documentosUsu VARCHAR(26),
  identidade NUMERIC(12),
  CPF NUMERIC(14),
  endereco VARCHAR(100),
  sexo CHAR(1) NOT NULL,
  dataNasc DATE NOT NULL,
  estadoCivil CHAR(1) NOT NULL,
  telefone VARCHAR(10)
);

-- Tabela Professor
CREATE TABLE Professor (
  matriculaProf INT PRIMARY KEY,
  codigoUsu INT NOT NULL,
  FOREIGN KEY (codigoUsu) REFERENCES UsuarioBiblioteca(codigoUsu)
);

-- Tabela Aluno
CREATE TABLE Aluno (
  matricula INT PRIMARY KEY,
  codigoUsu INT NOT NULL,
  FOREIGN KEY (codigoUsu) REFERENCES UsuarioBiblioteca(codigoUsu)
);

-- Tabela Transacao
CREATE TABLE Transacao (
  numerTrans INT PRIMARY KEY,
  dataTrans DATE NOT NULL,
  horarioTrans TIME NOT NULL
);

-- Tabela Emprestimo
CREATE TABLE Emprestimo (
  codigoEmprestimo INT PRIMARY KEY,
  codigoUsu INT NOT NULL,
  dataEmprestimo DATE NOT NULL,
  FOREIGN KEY (codigoUsu) REFERENCES UsuarioBiblioteca(codigoUsu)
);

-- Tabela Devolucao
CREATE TABLE Devolucao (
  codigoDevolucao INT PRIMARY KEY,
  codigoUsu INT NOT NULL,
  dataDevolucao DATE NOT NULL,
  FOREIGN KEY (codigoUsu) REFERENCES UsuarioBiblioteca(codigoUsu)
);

-- Tabela Reserva
CREATE TABLE Reserva (
  codigoReserva INT PRIMARY KEY,
  codigoUsu INT NOT NULL,
  dataReserva DATE NOT NULL,
  FOREIGN KEY (codigoUsu) REFERENCES UsuarioBiblioteca(codigoUsu)
);

-- Tabela Renovacao
CREATE TABLE Renovacao (
  codigoRenovacao INT PRIMARY KEY,
  codigoUsu INT NOT NULL,
  dataRenovacao DATE NOT NULL,
  FOREIGN KEY (codigoUsu) REFERENCES UsuarioBiblioteca(codigoUsu)
);

-- Tabela ItemEmprestimo
CREATE TABLE ItemEmprestimo (
  numeroItem INT PRIMARY KEY,
  codigoEmprestimo INT NOT NULL,
  codigoCopiaTitulo INT NOT NULL,
  dataLimiteDev DATE NOT NULL,
  situacaoCopia VARCHAR(1),
  multaAtraso NUMERIC(7,2),
  multaDano NUMERIC(7,2),
  FOREIGN KEY (codigoEmprestimo) REFERENCES Emprestimo(codigoEmprestimo),
  FOREIGN KEY (codigoCopiaTitulo) REFERENCES CopiaTitulo(numero
  
  );
);