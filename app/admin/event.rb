ActiveAdmin.register Event do

  permit_params :name, :date, :time, :address, :details, :image, :url, :workshop, :masterclass, :venue_id

  filter :name
  filter :created_at
  filter :workshop
  filter :masterclass

  index do
    selectable_column
    id_column
    column :name
    column :date
    column :venue do |event|
      if event.venue.present?
        event.venue.first.name
      end
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :date
      row :time
      row :venue do |event|
        if event.venue.present?
          event.venue.first.name
        end
      end
      row :workshop
      row :masterclass
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :date
      f.input :time
      f.input :details
      f.input :image
      f.select :venue, Venue.pluck(:name, :id)
      f.input :workshop
      f.input :masterclass
    end
    f.actions
  end


end
