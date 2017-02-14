ActiveAdmin.register Event do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :id, :name, :date, :time, :address, :details, :image, :url, :workshop, :masterclass

filter :name
filter :created_at
filter :workshop
filter :masterclass


end
