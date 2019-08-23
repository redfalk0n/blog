ActiveAdmin.register Post do
  menu label: "Посты"
  permit_params :title, :subheader, :image, :content, :author, :created_at, :updated_at
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

  filter :title, label: "Заголовок"
  filter :author, label: "Автор"
  filter :content, label: "Текст новости"
  filter :created_at, label: "Создано"
  filter :updated_at, label: "Обновлено"

  form do |f|
    f.inputs do
      f.input :title, label: "Заголовок"
      f.input :subheader, label: "Подзаголовок"
      f.input :image, as: :file, label: "Изображение"
      f.input :content, as: :html_editor, label: "Тело новости"
      f.input :author, label: "Автор"
      f.input :edition, label: "Редакция (макисмум 5)", input_html: { disabled: true } unless f.object.new_record?
    end
    f.actions
    f.semantic_errors *f.object.errors.keys
  end

  show do
    attributes_table do
      row "Заголовок" do |a|
        a.title
      end
      row "Подзаголовок" do |a|
        a.subheader
      end
      row "Изображение" do |a|
        image_tag url_for(a.image)
      end
      row "Тело новости" do |a|
        a.content
      end
      row "Автор" do |a|
        a.author
      end
      row "Редакция (макисмум 5)" do |a|
        a.edition
      end
    end
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

end
