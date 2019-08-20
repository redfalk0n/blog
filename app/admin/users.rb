ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :created_at, :updated_at

  index do
    selectable_column
    id_column
    column :email
    column :encrypted_password
    column :updated_at
    column :created_at
    actions
  end

  filter :email

  form do |f|
    f.inputs do
      f.input :email
    end
    f.actions
  end

end

