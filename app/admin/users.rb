ActiveAdmin.register User do
  menu label: "Пользователи"
  permit_params :email, :encrypted_password, :created_at, :updated_at, :digest_frequency

  index do
    selectable_column
    id_column
    column :email
    column "Получение дайджеста" do |u|
      if u.digest_frequency == "weekly"
        span "Еженедельно"
      elsif u.digest_frequency == "daily"
        span "Ежедневно"
      else
        span "Никогда"
      end
    end
    column "Последнее обновление", :updated_at
    column "Зарегистрирован", :created_at
    actions
  end

  filter :email
  filter :digest_frequency, label: "Получение дайджеста"
  filter :created_at, label: "Зарегистрирован"
  filter :updated_at, label: "Последнее обновление"

  form do |f|
    f.inputs do
      f.input :email, input_html: { disabled: true }
      f.input :digest_frequency, label: "Получение дайджеста", as: :select, collection: [["Еженедельно", "weekly"], ["Ежедневно", "daily"], ["Никогда", "never"]]
    end
    f.actions
  end

end

