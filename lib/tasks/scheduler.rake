namespace :memberships  do
  desc "Update membership expiration dates"
  task :rollover_membership_expiration_date => :environment do
    puts "Finding expired memebrships"
    Membership.rollover_expiration_date
    puts "done"
  end
end
