# ЛР 4. Работа с элементом управления BindingNavigator

Студент: Fedorova

Windows Forms (.NET Framework 4.7.2) + Entity Framework 6 (Code First из БД).
Вывод, добавление, изменение и удаление пользователей БД `DB_Users` (таблицы Users, Roles)
через BindingSource, BindingNavigator, DataGridView и ComboBox ролей.

Запуск:
1. Выполнить `DB_Users.sql` в SQL Server (экземпляр `.\SQLEXPRESS`).
2. Открыть `Fedorova.sln` в Visual Studio 2022, NuGet-пакет EntityFramework восстановится сам.
3. При другом имени сервера поправить строку подключения `ModelEF` в `App.config`.
