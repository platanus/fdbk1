ActiveAdmin.register SessionTag do
  permit_params :feedback_session_id, :tag_id

  index do
    selectable_column
    id_column
    column :feedback_session_id
    column :tag_id
    actions
  end

  show do
    attributes_table do
      row :feedback_session_id
      row :tag_id
    end
  end

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :feedback_session_id
      f.input :tag_id
    end

    f.actions
  end
end
