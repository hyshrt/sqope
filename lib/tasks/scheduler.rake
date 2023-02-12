desc "This task is called by the Heroku scheduler add-on"
task :test_scheduler => :environment do
  puts "scheduler test"
  puts "it works."
end


task :change_to_offerring => :environment do
  start_datetime_past_program = Program.release_opened.start_datetime_past
    start_datetime_past_program.update(program_state: 2)
end

task :change_to_deadline_up_close => :environment do
  deadline_up_close_program = Program.release_opened.end_datetime_week_since
  deadline_up_close_program.update(program_state: 3)
end

task :change_to_close => :environment do
  end_datetime_past_program = Program.release_opened.end_datetime_past
    end_datetime_past_program.update(program_state: 4, release_and_status: 2)
end