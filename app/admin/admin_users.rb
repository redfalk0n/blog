ActiveAdmin.register AdminUser do
  menu label: "Администраторы"
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column "Зарегистрирован", :created_at
    actions
  end

  filter :email
  filter :created_at, label: "Зарегистрирован"

  form do |f|
    f.inputs do
      f.input :email
      f.input :password, label: "Пароль"
      f.input :password_confirmation, label: "Подтверждение пароля"
    end
    f.actions
  end

end
