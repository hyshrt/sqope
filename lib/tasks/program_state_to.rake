namespace :program_state_to do
  desc '「公開」かつ募集開始日から7日経過したら「募集中」にステータスを変更'
  task change_to_offerring: :environment do
    start_datetime_past_program = Program.release_opened.start_datetime_past
    start_datetime_past_program.update(program_state: 2)
  end
end

namespace :program_state_to_deadline_up_close do
  desc '「公開」かつ募集終了日の7日前になったら「締切間近」にステータスを変更'
  task change_to_deadline_up_close: :environment do
    deadline_up_close_program = Program.release_opened.end_datetime_week_since
    deadline_up_close_program.update(program_state: 3)
  end
end

namespace :program_state_to_close do
  desc '「公開」かつ募集終了日時を過ぎたら「募集終了」にステータスを変更'
  task change_to_close: :environment do
    end_datetime_past_program = Program.release_opened.end_datetime_past
    end_datetime_past_program.update(program_state: 4, release_and_status: 2)
  end
end
