ActiveAdmin.register User do
  index do
    selectable_column
    column :id
    column :company_name
    column :last_name
    column :first_name
    column :email
    column :phone_number
    column :created_at
    column :admin
    actions
  end
end
