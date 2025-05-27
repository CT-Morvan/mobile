///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsPt = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	String get ctMorvan => 'CT Morvan';
	String get email => 'E-mail';
	String get emailHint => 'email@gmail.com';
	String get name => 'Nome';
	String get nameHint => 'Nome Sobrenome';
	String get password => 'Senha';
	String get confirmPassword => 'Confirmar senha';
	String get passwordAreNotTheSame => 'As senhas não são iguais';
	String get changePassword => 'Trocar senha';
	String get logout => 'Logout';
	String get access => 'Acessar';
	String get createUser => 'Criar usuário';
	String get users => 'Usuários';
	String get tests => 'Testes';
	String get adminUser => 'Usuário administrador';
	String welcomeTitle({required Object name}) => 'Bem vindo ao CT Morvan ${name}!';
	String get welcomeDescription => 'Para continuar precisamos criar uma senha!';
	String get kContinue => 'Continuar';
	String get date => 'Data';
	String get maximumRep => 'Carga máxima';
	String get maximumRepTest => 'Teste de carga';
	String get maxReps => 'Máximo de repetições';
	String get maxWorkload => 'Carga utilizada';
	String get kg => 'kg';
	String get storeTests => 'Criar testes';
	String get bioimpedance => 'Bioimpedância';
	String get genericError => 'Ocorreu um erro inesperado';
	String get usersListEmpty => 'Sem usuários cadastrados';
	String get tryAgain => 'Tentar novamente';
	String get requiredField => 'Campo obrigatório';
	String get passwordRequirements => 'A senha deve possuir pelo menos 8 caracteres';
	String patient({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		one: 'Aluno',
		other: 'Alunos',
	);
	String admin({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		one: 'Administrador',
		other: 'Administradores',
	);
	String get formSendSuccessfully => 'Teste salvo com sucesso';
	String get maximumRepMinimum => 'As repetições precisam ser no mínimo 1';
	String get maximumRepWorkloadMinimum => 'A carga usada precisa ser no mínimo 1 kg';
	String get invalidCredentials => 'Usuário ou senha incorretas';
	String viewTestsTitle({required Object name}) => 'Visualizar teste ${name}';
	String get height => 'Altura';
	String get weight => 'Peso';
	String get imc => 'IMC';
	String get fatPercentage => 'Percentual de gordura';
	String get musclePercentage => 'Percentual muscular';
	String get basalMetabolism => 'Metabolismo basal';
	String get metabolicAge => 'Idade metabólica';
	String get visceralFat => 'Gordura visceral';
	String get years => 'Anos';
	String get percentageSymbol => '%';
	String minimumValue({required Object value}) => 'O valor mínimo tem que ser maior que ${value}';
	String get cm => 'cm';
	String get actions => 'Ações';
	String get delete => 'Excluir';
	String get edit => 'Editar';
	String get patientsListEmpty => 'Sem alunos cadastrados';
	String get createPatient => 'Criar aluno';
	String get adminListEmpty => 'Sem administradores cadastrados';
	String get createAdmin => 'Criar administrador';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'ctMorvan': return 'CT Morvan';
			case 'email': return 'E-mail';
			case 'emailHint': return 'email@gmail.com';
			case 'name': return 'Nome';
			case 'nameHint': return 'Nome Sobrenome';
			case 'password': return 'Senha';
			case 'confirmPassword': return 'Confirmar senha';
			case 'passwordAreNotTheSame': return 'As senhas não são iguais';
			case 'changePassword': return 'Trocar senha';
			case 'logout': return 'Logout';
			case 'access': return 'Acessar';
			case 'createUser': return 'Criar usuário';
			case 'users': return 'Usuários';
			case 'tests': return 'Testes';
			case 'adminUser': return 'Usuário administrador';
			case 'welcomeTitle': return ({required Object name}) => 'Bem vindo ao CT Morvan ${name}!';
			case 'welcomeDescription': return 'Para continuar precisamos criar uma senha!';
			case 'kContinue': return 'Continuar';
			case 'date': return 'Data';
			case 'maximumRep': return 'Carga máxima';
			case 'maximumRepTest': return 'Teste de carga';
			case 'maxReps': return 'Máximo de repetições';
			case 'maxWorkload': return 'Carga utilizada';
			case 'kg': return 'kg';
			case 'storeTests': return 'Criar testes';
			case 'bioimpedance': return 'Bioimpedância';
			case 'genericError': return 'Ocorreu um erro inesperado';
			case 'usersListEmpty': return 'Sem usuários cadastrados';
			case 'tryAgain': return 'Tentar novamente';
			case 'requiredField': return 'Campo obrigatório';
			case 'passwordRequirements': return 'A senha deve possuir pelo menos 8 caracteres';
			case 'patient': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
				one: 'Aluno',
				other: 'Alunos',
			);
			case 'admin': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
				one: 'Administrador',
				other: 'Administradores',
			);
			case 'formSendSuccessfully': return 'Teste salvo com sucesso';
			case 'maximumRepMinimum': return 'As repetições precisam ser no mínimo 1';
			case 'maximumRepWorkloadMinimum': return 'A carga usada precisa ser no mínimo 1 kg';
			case 'invalidCredentials': return 'Usuário ou senha incorretas';
			case 'viewTestsTitle': return ({required Object name}) => 'Visualizar teste ${name}';
			case 'height': return 'Altura';
			case 'weight': return 'Peso';
			case 'imc': return 'IMC';
			case 'fatPercentage': return 'Percentual de gordura';
			case 'musclePercentage': return 'Percentual muscular';
			case 'basalMetabolism': return 'Metabolismo basal';
			case 'metabolicAge': return 'Idade metabólica';
			case 'visceralFat': return 'Gordura visceral';
			case 'years': return 'Anos';
			case 'percentageSymbol': return '%';
			case 'minimumValue': return ({required Object value}) => 'O valor mínimo tem que ser maior que ${value}';
			case 'cm': return 'cm';
			case 'actions': return 'Ações';
			case 'delete': return 'Excluir';
			case 'edit': return 'Editar';
			case 'patientsListEmpty': return 'Sem alunos cadastrados';
			case 'createPatient': return 'Criar aluno';
			case 'adminListEmpty': return 'Sem administradores cadastrados';
			case 'createAdmin': return 'Criar administrador';
			default: return null;
		}
	}
}

