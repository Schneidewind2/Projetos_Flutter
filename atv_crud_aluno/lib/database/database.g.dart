// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorBancoDeDadosApp {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BancoDeDadosAppBuilder databaseBuilder(String name) =>
      _$BancoDeDadosAppBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BancoDeDadosAppBuilder inMemoryDatabaseBuilder() =>
      _$BancoDeDadosAppBuilder(null);
}

class _$BancoDeDadosAppBuilder {
  _$BancoDeDadosAppBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$BancoDeDadosAppBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$BancoDeDadosAppBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<BancoDeDadosApp> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$BancoDeDadosApp();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$BancoDeDadosApp extends BancoDeDadosApp {
  _$BancoDeDadosApp([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AlunoDAO? _alunoDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Aluno` (`curso` TEXT NOT NULL, `matricula` TEXT NOT NULL, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `nome` TEXT NOT NULL, `dataNasc` TEXT NOT NULL, `sexo` TEXT NOT NULL, `dataCriacao` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AlunoDAO get alunoDAO {
    return _alunoDAOInstance ??= _$AlunoDAO(database, changeListener);
  }
}

class _$AlunoDAO extends AlunoDAO {
  _$AlunoDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _alunoInsertionAdapter = InsertionAdapter(
            database,
            'Aluno',
            (Aluno item) => <String, Object?>{
                  'curso': item.curso,
                  'matricula': item.matricula,
                  'id': item.id,
                  'nome': item.nome,
                  'dataNasc': item.dataNasc,
                  'sexo': item.sexo,
                  'dataCriacao': item.dataCriacao
                },
            changeListener),
        _alunoUpdateAdapter = UpdateAdapter(
            database,
            'Aluno',
            ['id'],
            (Aluno item) => <String, Object?>{
                  'curso': item.curso,
                  'matricula': item.matricula,
                  'id': item.id,
                  'nome': item.nome,
                  'dataNasc': item.dataNasc,
                  'sexo': item.sexo,
                  'dataCriacao': item.dataCriacao
                },
            changeListener),
        _alunoDeletionAdapter = DeletionAdapter(
            database,
            'Aluno',
            ['id'],
            (Aluno item) => <String, Object?>{
                  'curso': item.curso,
                  'matricula': item.matricula,
                  'id': item.id,
                  'nome': item.nome,
                  'dataNasc': item.dataNasc,
                  'sexo': item.sexo,
                  'dataCriacao': item.dataCriacao
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Aluno> _alunoInsertionAdapter;

  final UpdateAdapter<Aluno> _alunoUpdateAdapter;

  final DeletionAdapter<Aluno> _alunoDeletionAdapter;

  @override
  Stream<Aluno?> getById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM aluno WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Aluno(
            id: row['id'] as int?,
            nome: row['nome'] as String,
            dataNasc: row['dataNasc'] as String,
            sexo: row['sexo'] as String,
            dataCriacao: row['dataCriacao'] as String,
            curso: row['curso'] as String,
            matricula: row['matricula'] as String),
        arguments: [id],
        queryableName: 'Aluno',
        isView: false);
  }

  @override
  Stream<List<Aluno>> getAll() {
    return _queryAdapter.queryListStream('SELECT * FROM aluno',
        mapper: (Map<String, Object?> row) => Aluno(
            id: row['id'] as int?,
            nome: row['nome'] as String,
            dataNasc: row['dataNasc'] as String,
            sexo: row['sexo'] as String,
            dataCriacao: row['dataCriacao'] as String,
            curso: row['curso'] as String,
            matricula: row['matricula'] as String),
        queryableName: 'Aluno',
        isView: false);
  }

  @override
  Future<int> insertItem(Aluno item) {
    return _alunoInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(Aluno item) {
    return _alunoUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(Aluno item) {
    return _alunoDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}
