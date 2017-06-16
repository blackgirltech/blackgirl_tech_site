ActiveAdmin.register Event do

  permit_params :name, :date, :time, :address, :details, :image, :url, :workshop, :masterclass

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

  form do |f|
    f.inputs do
      f.input :name
      f.input :date
      f.input :time
      f.input :details
      f.input :image
      f.input :venue, as: :select, collection: Venue.pluck(:name)
      f.input :workshop
      f.input :masterclass
    end
    f.actions
  end


end
