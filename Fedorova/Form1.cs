using System;
using System.Data.Entity;
using System.Windows.Forms;
using Fedorova.Model;

namespace Fedorova
{
    public partial class Form1 : Form
    {
        // Объект модели EF (контекст базы данных DB_Users)
        ModelEF model = new ModelEF();

        public Form1()
        {
            InitializeComponent();
        }

        // Загрузка данных из БД в источники данных
        void StartLoadData()
        {
            model.Roles.Load();
            rolesBindingSource.DataSource = model.Roles.Local.ToBindingList();

            model.Users.Load();
            usersBindingSource.DataSource = model.Users.Local.ToBindingList();
        }

        // Синхронизация источника данных с моделью и сохранение в БД
        void SaveData()
        {
            try
            {
                Validate();
                usersBindingSource.EndEdit();
                model.SaveChanges();
                MessageBox.Show("Данные сохранены", "Сохранение",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка сохранения: " + (ex.InnerException?.InnerException?.Message ?? ex.Message),
                    "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            StartLoadData();
        }

        private void bindingNavigatorAddNewItem_Click(object sender, EventArgs e)
        {
            // У новой записи выбираем в ComboBox первую (0) роль
            if (role_NameComboBox.Items.Count > 0)
            {
                role_NameComboBox.SelectedIndex = 0;
                if (usersBindingSource.Current is Users user && rolesBindingSource.Current is Roles role)
                    user.Role_Name = role.Name;
            }
        }

        private void bindingNavigatorDeleteItem_Click(object sender, EventArgs e)
        {
            SaveData();
        }

        private void usersBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            SaveData();
        }
    }
}
