task :cron => :environment do
  if Time.now.hour == 0
    puts "Updating feed..."
    # NewsFeed.nightly_update
    sys "rake data:import:feed"
    puts "done."
  end
end
