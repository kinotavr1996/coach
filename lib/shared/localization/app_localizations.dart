import 'package:flutter/widgets.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = [
    Locale('en'),
    Locale('uk'),
  ];

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  String t(String key) {
    final lang = locale.languageCode;
    return _values[lang]?[key] ?? _values['en']?[key] ?? key;
  }

  static const Map<String, Map<String, String>> _values = {
    'en': {
      'appTitle': 'ClarityCoach AI',
      'onboardingTitle': 'Welcome to ClarityCoach AI',
      'continue': 'Continue',
      'dashboardTitle': 'ClarityCoach AI',
      'todayFocus': 'Today\'s focus',
      'sections': 'Sections',
      'goalsTitle': 'Goals – GROW & SMART',
      'checkinsTitle': 'Check-ins',
      'analyticsTitle': 'Analytics & Insights',
      'northStarTitle': 'North Star',
      'profileTitle': 'Profile & Role',
      'remindersTitle': 'Reminders',
      'calendarTitle': 'Calendar Integration',
      'partnerTitle': 'Partner Accountability',
      'templatesTitle': 'Template Library',
      'exportTitle': 'Export',
      'activityLogTitle': 'Activity Log',
      'rolesTitle': 'Roles',
      'newGoal': 'New goal',
      'newCheckIn': 'New check-in',
      'newReminder': 'New reminder',
      'newRole': 'New role',
      'newPartner': 'Add partner',
      'exportSummary': 'Export summary',
      'saveProfile': 'Save profile',
      'saveGoal': 'Save goal',
      'saveCheckIn': 'Save check-in',
      'saveReminder': 'Save reminder',
      'saveRole': 'Save role',
      'savePartner': 'Save partner',
      'saveNorthStar': 'Save',
    },
    'uk': {
      'appTitle': 'ClarityCoach AI',
      'onboardingTitle': 'Ласкаво просимо до ClarityCoach AI',
      'continue': 'Продовжити',
      'dashboardTitle': 'ClarityCoach AI',
      'todayFocus': 'Фокус сьогодні',
      'sections': 'Розділи',
      'goalsTitle': 'Цілі – GROW & SMART',
      'checkinsTitle': 'Чек-іни',
      'analyticsTitle': 'Аналітика та інсайти',
      'northStarTitle': 'North Star',
      'profileTitle': 'Профіль і роль',
      'remindersTitle': 'Нагадування',
      'calendarTitle': 'Інтеграція з календарем',
      'partnerTitle': 'Партнерська підзвітність',
      'templatesTitle': 'Бібліотека шаблонів',
      'exportTitle': 'Експорт',
      'activityLogTitle': 'Журнал активності',
      'rolesTitle': 'Ролі',
      'newGoal': 'Нова ціль',
      'newCheckIn': 'Новий чек-ін',
      'newReminder': 'Нове нагадування',
      'newRole': 'Нова роль',
      'newPartner': 'Додати партнера',
      'exportSummary': 'Експортувати звіт',
      'saveProfile': 'Зберегти профіль',
      'saveGoal': 'Зберегти ціль',
      'saveCheckIn': 'Зберегти чек-ін',
      'saveReminder': 'Зберегти нагадування',
      'saveRole': 'Зберегти роль',
      'savePartner': 'Зберегти партнера',
      'saveNorthStar': 'Зберегти',
    },
  };
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'uk'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
