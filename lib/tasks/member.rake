namespace :members do
  desc 'Update members subscribed_to_email to use contact_permission field'
  task :use_contact_permission => :environment do
    Members.each do |member|
      member.subscribed_to_email ? member.update(contact_permission: true) : member.update(contact_permission: false)
    end
    puts "done"
  end
end
