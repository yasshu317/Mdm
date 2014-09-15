namespace :myspace do
  task :pulic => :environment do
    current_dir = %x[pwd]
    current_dir = current_dir.squish
	#remove all links and create new
	%x[rm -rf #{current_dir}/public/stylesheets]
	%x[rm -rf #{current_dir}/public/javascripts]

	puts "creating link files for javascripts,stylesheets, images."
	# %x[ln -s #{current_dir}/app/assets/javascripts/* #{current_dir}/public/javascripts]
	# %x[ln -s #{current_dir}/app/assets/stylesheets/* #{current_dir}/public/stylesheets]

	%x[ln -s #{current_dir}/app/assets/javascripts #{current_dir}/public/]
	%x[ln -s #{current_dir}/app/assets/stylesheets #{current_dir}/public/]
	%x[ln -s #{current_dir}/app/assets/images/* #{current_dir}/public/stylesheets]
	puts "Done ..."
  end
end