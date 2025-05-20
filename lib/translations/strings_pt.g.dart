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
	String get passwordRequirements => 'A senha precisa ter pelo menos 8 caracteres, sendo uma letra, um número, e um caractere especial';
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
			case 'passwordRequirements': return 'A senha precisa ter pelo menos 8 caracteres, sendo uma letra, um número, e um caractere especial';
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
			default: return null;
		}
	}
}

