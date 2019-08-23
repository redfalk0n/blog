ActiveAdmin.register Post do
  permit_params :title, :content, :author, :created_at, :updated_at
  actions :all

  index do
    selectable_column
    id_column
    column "Заголовок", :title
    column "Автор", :author
    column "Кол-во редакций", :edition
    column "Создано", :created_at
    column "Последнее обновление", :updated_at
    actions
  end

  filter :title

  form do |f|
    f.inputs do
      f.input :title, label: "Заголовок"
      f.input :content, as: :html_editor, label: "Тело новости"
      f.input :author, label: "Автор"
      f.input :edition, label: "Редакция (макисмум 5)", input_html: { disabled: true } unless f.object.new_record?
    end
    f.actions
    f.semantic_errors *f.object.errors.keys
  end

  before_create do |post|
    post.edition = 1
    post.created_at = Time.now
    post.updated_at = Time.now
  end

  before_update do |post|
    post.updated_at = Time.now
    post.edition += 1
  end

  # action_item only: :create do
  #   byebug
  # end

end
